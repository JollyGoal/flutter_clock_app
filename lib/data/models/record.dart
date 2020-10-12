import 'package:flutter/material.dart';

class Record {
  final String dayTitle;
  final String date;
  final int minutes;

  Record({
    @required this.dayTitle,
    @required this.date,
    this.minutes = 0,
  });
}
