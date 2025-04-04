// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// Loops over all private keys in the app state variable 'privateKeys' and
/// uses the custom action wifKey2BitcoinAddress to populate the app state
/// 'addresses' with the corresponding addreses.
Future calculateAllAddresses() async {
  List<String> privateKeys = FFAppState().privateKeys;
  List<String> addresses = [];

  for (String privateKey in privateKeys) {
    String address = await wifKey2BitcoinAddress(privateKey); // Custom action
    addresses.add(address);
  }

  FFAppState().addresses = addresses; // Populate app state with addresses
}
