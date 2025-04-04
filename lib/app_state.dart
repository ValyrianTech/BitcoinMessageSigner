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
    _safeInit(() {
      _addresses = prefs.getStringList('ff_addresses') ?? _addresses;
    });
    _safeInit(() {
      _defaultAddressIndex =
          prefs.getInt('ff_defaultAddressIndex') ?? _defaultAddressIndex;
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

  List<String> _addresses = [];
  List<String> get addresses => _addresses;
  set addresses(List<String> value) {
    _addresses = value;
    prefs.setStringList('ff_addresses', value);
  }

  void addToAddresses(String value) {
    addresses.add(value);
    prefs.setStringList('ff_addresses', _addresses);
  }

  void removeFromAddresses(String value) {
    addresses.remove(value);
    prefs.setStringList('ff_addresses', _addresses);
  }

  void removeAtIndexFromAddresses(int index) {
    addresses.removeAt(index);
    prefs.setStringList('ff_addresses', _addresses);
  }

  void updateAddressesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addresses[index] = updateFn(_addresses[index]);
    prefs.setStringList('ff_addresses', _addresses);
  }

  void insertAtIndexInAddresses(int index, String value) {
    addresses.insert(index, value);
    prefs.setStringList('ff_addresses', _addresses);
  }

  int _defaultAddressIndex = 0;
  int get defaultAddressIndex => _defaultAddressIndex;
  set defaultAddressIndex(int value) {
    _defaultAddressIndex = value;
    prefs.setInt('ff_defaultAddressIndex', value);
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
