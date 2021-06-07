package com.lapangankita.mobile

import com.midtrans.sdk.corekit.core.TransactionRequest
import com.midtrans.sdk.corekit.models.BankType
import com.midtrans.sdk.corekit.models.CustomerDetails
import com.midtrans.sdk.corekit.models.ItemDetails
import com.midtrans.sdk.corekit.models.snap.CreditCard


object DataCustomer {
    var NAME="Trevincen"
    var PHONE="0812312411"
    var EMAIL="trevincentambunan@gmail.com"

    fun customerDetails(): CustomerDetails {
        var cd=CustomerDetails()
        cd.firstName=NAME
        cd.phone=PHONE
        cd.email=EMAIL
        return cd
    }


    fun transactionRequest(id:String?,price:Int,qty:Int,name:String?): TransactionRequest {
         val totalPrice = price * qty;

        val request=TransactionRequest(System.currentTimeMillis().toString()+" ",totalPrice.toDouble())
        request.setCustomerDetails(customerDetails())

        val details= ItemDetails(id, price.toDouble(),qty,name)
        val itemDetails=ArrayList<ItemDetails>()
        itemDetails.add(details)
        request.itemDetails=itemDetails

        val creditCard= CreditCard()
        creditCard.isSaveCard = false
        creditCard.channel = CreditCard.MIGS
        creditCard.bank = BankType.MANDIRI
        request.creditCard=creditCard

        return request
    }
}
