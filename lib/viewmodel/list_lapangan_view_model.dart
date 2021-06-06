import 'package:flutter/cupertino.dart';
import 'package:lapangankita_user/models/models.dart';
import 'package:lapangankita_user/services/services.dart';
import 'package:lapangankita_user/viewmodel/lapangan_view_model.dart';
import 'package:lapangankita_user/viewmodel/partner_view_model.dart';

class ListLapanganViewModel extends ChangeNotifier {
  List<LapanganViewModel> lapangans = [];
  List<Lapangan> laps = [];

  // Future<void> fetchLapangans(String keyword) async {
  //   print(keyword);
  //   final lapangans = await LapanganService.getLapangans();

  //   List<Lapangans> filtered = List<Lapangans>();
  //   lapangans.forEach((l) {
  //     print(l.jenis == keyword);
  //     if (l.jenis == keyword) filtered.add(l);
  //   });

  //   print("filtered = " + filtered.length.toString());

  //   this.lapangans =
  //       filtered.map((item) => LapanganViewModel(lapangan: item)).toList();

  //   print(this.lapangans);
  //   notifyListeners();
  // }

  Future<void> fetchLapanganByType(String keyword) async {
    print(keyword);
    var laps = await LapanganService.getMitra();

    print("print lapangan");
    print(lapangans);

    List<Lapangan> filtered = [];
    laps.forEach((l) {
      print(l.jenis == keyword);
      if (l.jenis == keyword) filtered.add(l);
    });

    print("filtered = " + filtered.length.toString());

    this.laps = filtered;

    notifyListeners();
  }

  Future<void> fetchLapangan() async {
    var laps = await LapanganService.getMitra();

    print("print lapangan");
    print(lapangans);

    print("filtered = " + laps.length.toString());

    this.laps = laps;

    notifyListeners();
  }
}
