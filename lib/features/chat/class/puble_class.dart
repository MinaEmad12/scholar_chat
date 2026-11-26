import 'package:flutter/material.dart';

class PaddingPuble {
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingRight;
  final double? paddingLeft;

  PaddingPuble({
    this.paddingTop,
    this.paddingBottom,
    this.paddingRight,
    this.paddingLeft,
  });
}

class RadiusPuble {
  final double? bottomLeft;
  final double topLeft;
  final double topRight;
  final double? bottomRight;

  RadiusPuble(
      {this.bottomLeft,
      required this.topLeft,
      required this.topRight,
      this.bottomRight});
}

class TextPuble {
  final String textFont;
  final double textSize;
  final bool? fontWeight1;
  final FontWeight? fontWeight2;
  final Color? textColor;
  final Alignment? alignment;
  TextPuble(
      {required this.textFont,
      required this.textSize,
      this.fontWeight1,
      this.fontWeight2,
      this.textColor,
      this.alignment});
}

class MarginPuble {
  final double? marginHorizontal;
  final double? marginVertical;

  MarginPuble({this.marginHorizontal, this.marginVertical});
}
