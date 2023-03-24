import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String? parseStringDate(DateTime? date) {
  if (date != null) {
    return DateFormat("MM-dd-yy, HH:ss").format(date);
  } else {
    return null;
  }
}
