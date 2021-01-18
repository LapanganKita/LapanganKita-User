import 'package:flutter/cupertino.dart';
import 'package:lapangankita_user/models/models.dart';
import 'package:lapangankita_user/services/services.dart';
import 'package:lapangankita_user/viewmodel/lapangan_view_model.dart';
import 'package:lapangankita_user/viewmodel/partner_view_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  List<Lap> laps = List<Lap>();

  Future<void> fetchFavorite() async {
    var laps = await UserServices.getFavorite();

    print("print lapangan");

    print("favorite lapangan = " + laps.length.toString());

    this.laps = laps;

    notifyListeners();
  }
}
