import 'package:flutter/material.dart';

var signals;

String url = 'http://coding-assignment.bombayrunning.com/data.json';
bool isGreen = false;

turnGreen(val) {
  if (val == 'green') {
    return Colors.green;
  } else {
    return Colors.red;
  }
}
