import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loader() {
  int i = Random().nextInt(5);

  switch (i) {
    case 0:
      return const SpinKitChasingDots(color: Colors.redAccent);
    case 1:
      return const SpinKitSpinningLines(color: Colors.black54);
    case 2:
      return const SpinKitFadingCube(color: Colors.green);
    case 3:
      return const SpinKitPulsingGrid(color: Colors.teal);
    default:
      return const SpinKitCubeGrid(color: Colors.black54);
  }
}
