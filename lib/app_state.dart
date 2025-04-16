import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _userId = 1033141673;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
  }

  String _role = 'user';
  String get role => _role;
  set role(String value) {
    _role = value;
  }
}
