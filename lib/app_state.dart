import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _privateKeys = prefs.getStringList('ff_privateKeys') ?? _privateKeys;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _privateKeys = [];
  List<String> get privateKeys => _privateKeys;
  set privateKeys(List<String> value) {
    _privateKeys = value;
    prefs.setStringList('ff_privateKeys', value);
  }

  void addToPrivateKeys(String value) {
    privateKeys.add(value);
    prefs.setStringList('ff_privateKeys', _privateKeys);
  }

  void removeFromPrivateKeys(String value) {
    privateKeys.remove(value);
    prefs.setStringList('ff_privateKeys', _privateKeys);
  }

  void removeAtIndexFromPrivateKeys(int index) {
    privateKeys.removeAt(index);
    prefs.setStringList('ff_privateKeys', _privateKeys);
  }

  void updatePrivateKeysAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    privateKeys[index] = updateFn(_privateKeys[index]);
    prefs.setStringList('ff_privateKeys', _privateKeys);
  }

  void insertAtIndexInPrivateKeys(int index, String value) {
    privateKeys.insert(index, value);
    prefs.setStringList('ff_privateKeys', _privateKeys);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
