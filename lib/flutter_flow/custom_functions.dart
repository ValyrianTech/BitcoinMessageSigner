import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

/// return the index of value in the list of given values
int? getIndex(
  String value,
  List<String> values,
) {
  // return the index of value in the list of given values
  return values.indexOf(value);
}

/// convert string to JSON
dynamic toJSON(String value) {
  // convert string to JSON
  return json.decode(value);
}
