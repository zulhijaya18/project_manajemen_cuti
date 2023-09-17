import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_manajemen_cuti/models/cuti_model.dart';

class CutiDiajukanProvider extends ChangeNotifier {
  final List<CutiModel> _data = [];
  List<CutiModel> get data => _data;

  void addData(CutiModel newdata) {
    _data.add(newdata);
    notifyListeners();
  }

  void deleteData(int index) {
    final item = _data.firstWhere((item) => item.id == index);
    _data.remove(item);
    notifyListeners();
  }
}
