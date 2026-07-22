import 'package:flutter/material.dart';

class AppRadii {
  AppRadii._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double pill = 999;

  static BorderRadius get card => BorderRadius.circular(md);
  static BorderRadius get button => BorderRadius.circular(lg);
  static BorderRadius get badge => BorderRadius.circular(pill);
}
