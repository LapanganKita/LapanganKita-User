import 'package:flutter/cupertino.dart';
import 'package:lapangankita_user/models/models.dart';
import 'package:lapangankita_user/services/services.dart';
import 'package:lapangankita_user/viewmodel/lapangan_view_model.dart';
import 'package:lapangankita_user/viewmodel/partner_view_model.dart';

class ListLapanganViewModel extends ChangeNotifier {
  List<LapanganViewModel> lapangans = List<LapanganViewModel>();

  Future<void> fetchLapangans(String keyword) async {
    print(keyword);
    final lapangans = await LapanganService.getLapangans();

    List<Lapangans> filtered = List<Lapangans>();
    lapangans.forEach((l) {
      print(l.jenis == keyword);
      if (l.jenis == keyword) filtered.add(l);
    });

    print("filtered = " + filtered.length.toString());

    this.lapangans =
        filtered.map((item) => LapanganViewModel(lapangan: item)).toList();

    print(this.lapangans);
    notifyListeners();
  }
}
