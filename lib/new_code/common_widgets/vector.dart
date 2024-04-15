import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget vector(String asset,
    {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color}) {
  return SvgPicture.asset(
    asset,
    width: width,
    height: height,
    fit: fit,
    color: color,
      allowDrawingOutsideViewBox:true
  );
}