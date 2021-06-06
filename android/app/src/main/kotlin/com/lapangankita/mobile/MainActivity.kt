package com.lapangankita.mobile

import android.annotation.SuppressLint
import android.os.Bundle
import android.widget.Toast
import com.lapangankita.mobile.BuildConfig.MERCHANT_BASE_URL
import com.lapangankita.mobile.BuildConfig.MERCHANT_CLIENT_KEY
import com.midtrans.sdk.corekit.callback.TransactionFinishedCallback
import com.midtrans.sdk.corekit.core.MidtransSDK
import com.midtrans.sdk.corekit.core.PaymentMethod
import com.midtrans.sdk.corekit.core.themes.CustomColorTheme
import com.midtrans.sdk.corekit.models.snap.Transaction
import com.midtrans.sdk.corekit.models.snap.TransactionResult
import com.midtrans.sdk.uikit.BuildConfig
import com.midtrans.sdk.uikit.SdkUIFlowBuilder
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant



class MainActivity: FlutterActivity(), TransactionFinishedCallback {

    companion object{
        const val CHANNEL = "com.lapangankita.mobile"
        const val KEY_NATIVE = "showPAYMENTLAPANGANKITA"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{call, result->
            if(call.method == KEY_NATIVE){
                val name = (""+call.argument("name"))
                val price = (""+call.argument("price")).toInt()
                val qty = (""+call.argument("quantity")).toInt()

                initMidtransSdk()

                MidtransSDK.getInstance().transactionRequest = DataCustomer.transactionRequest(
                        "1",
                        price,
                        qty,
                        name
                )

                MidtransSDK.getInstance().startPaymentUiFlow(this)


            }else {
                result.notImplemented()
            }

        }
    }

//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)
//
//        MethodChannel(flutterView.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{call, result->
//            if(call.method == KEY_NATIVE){
//                val name = (""+call.argument("name"))
//                val price = (""+call.argument("price")).toInt()
//                val qty = (""+call.argument("quantity")).toInt()
//
//                initMidtransSdk()
//
//                MidtransSDK.getInstance().transactionRequest = DataCustomer.transactionRequest(
//                        "1",
//                        price,
//                        qty,
//                        name
//                )
//
//                MidtransSDK.getInstance().startPaymentUiFlow(this, PaymentMethod.BANK_TRANSFER_MANDIRI)
//            }else {
//                result.notImplemented()
//            }
//
//        }
//    }

    private fun  initMidtransSdk(){
        SdkUIFlowBuilder.init().setContext(this)
        .setMerchantBaseUrl(MERCHANT_BASE_URL)
        .setClientKey(MERCHANT_CLIENT_KEY)
        .setTransactionFinishedCallback(this)
        .enableLog(true)
        .setColorTheme(CustomColorTheme("#FFE51255", "#B61548", "#FFE51255"))
        .buildSDK()

    }

    @SuppressLint("ShowToast")
    override fun onTransactionFinished(result: TransactionResult?){
        if (result != null) {
            if(result.response != null){
                when(result.status){
                    TransactionResult.STATUS_SUCCESS -> Toast.makeText(this, "Transaction Finished ID : "+result.response.transactionId, Toast.LENGTH_SHORT)

                    TransactionResult.STATUS_PENDING -> Toast.makeText(this, "Transaction Pending ID : "+result.response.transactionId, Toast.LENGTH_SHORT)

                    TransactionResult.STATUS_FAILED -> Toast.makeText(this, "Transaction Failed ID : "+result.response.transactionId, Toast.LENGTH_SHORT)
                }
                result.response.validationMessages

                return true
            } else if(result.isTransactionCanceled){
                Toast.makeText(this, "Transaction Canceled", Toast.LENGTH_SHORT)
            } else {
                if(result.status.equals(TransactionResult.STATUS_INVALID, ignoreCase= true)){
                    Toast.makeText(this, "Transaction Invalid", Toast.LENGTH_SHORT)
                }else{
                    Toast.makeText(this, "Transaction Finished with Failure", Toast.LENGTH_SHORT)
                }
            }
        }
    }
}
