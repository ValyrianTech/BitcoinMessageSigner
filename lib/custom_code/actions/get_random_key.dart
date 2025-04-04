// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dartsv/src/privatekey.dart';
import 'package:dartsv/src/networks.dart';

/// Generate a random bitcoin private key in wif format
Future<String> getRandomKey() async {
  final svPrivateKey = SVPrivateKey(networkType: NetworkType.MAIN);
  final wif = svPrivateKey.toWIF();

  return wif;
}
