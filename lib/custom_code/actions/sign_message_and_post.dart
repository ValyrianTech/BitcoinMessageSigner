// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart';
import 'package:dartsv/src/message.dart';
import 'package:dartsv/src/privatekey.dart';
import 'package:dartsv/src/networks.dart';

Future<String> signMessageAndPost(
  String msg,
  String url,
  String addr,
) async {
  // Add your function code here!
  int key_index = FFAppState().addresses.indexOf(addr);
  String wifKey = FFAppState().privateKeys[key_index];

  var signature = signMessage(msg, wifKey);
  var signedMessage = {
    'address': addr,
    'message': msg,
    'data': msg,
    'signature': signature
  };

  Map<String, String> headers = {"Content-type": "application/json"};

  Response response = await post(Uri.parse(url),
      headers: headers,
      body: json.encode(signedMessage)); // check the status code for the result
  int statusCode = response
      .statusCode; // this API passes back the id of the new item added to the body
  String body = response.body;

  if (statusCode == 200) {
    var parsedJson = json.decode(body);

    if (parsedJson is Map && parsedJson.containsKey('error') == true) {
      return parsedJson['error'];
    } else {
      return 'Message signed successfully';
    }
  } else {
    return 'Error ' + statusCode.toString() + ': ' + body;
  }
}

// A helper function to sign a message with a private key
String signMessage(String message, String wifKey) {
  SVPrivateKey privateKey = SVPrivateKey.fromWIF(wifKey);
  Message messageSigner = Message(const Utf8Codec().encode(message));
  String signature = messageSigner.sign(privateKey);
  return signature;
}
