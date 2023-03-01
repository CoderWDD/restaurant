

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

extension Px3pt on num {
  double get px3pt {
    final double textScaleFactor = WidgetsBinding.instance.window.textScaleFactor;
    // the unit of screen physical pixels is pt
    return (this / textScaleFactor).toDouble();
  }
}

extension Px2pt on num {
  double get px2pt => px3pt * 1.5;
}