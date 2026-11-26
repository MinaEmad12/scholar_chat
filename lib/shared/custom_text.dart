// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String textFont;
  final double textSize;
  final Color? textColor;
  final Color? groundTextColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final double? widthGroundTextColor;
  final double? heightGroundTextColor;
  final Alignment? alignment;
  final bool? fontWeight1;
  final FontWeight? fontWeight2;
  final bool? decoration;
  final TextAlign? textAlign;
  final String? fontFamily;

  const CustomText( {
    Key? key,
    required this.textFont,
    required this.textSize,
    this.textColor,
    this.groundTextColor,
    this.borderRadius,
    this.padding,
    this.widthGroundTextColor,
    this.heightGroundTextColor,
    this.alignment,
    this.decoration,
    this.textAlign,
    this.fontFamily,
    this.fontWeight1,
    this.fontWeight2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: heightGroundTextColor,
      width: widthGroundTextColor,
      decoration: BoxDecoration(
        color: groundTextColor,
        borderRadius: borderRadius,
      ),
      padding: padding,
      child: Text(
        textFont,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          decoration: decoration == true ? TextDecoration.lineThrough : null,
          fontSize: textSize.sp,
          fontWeight: fontWeight1 == true ? FontWeight.bold : fontWeight2,
          color: textColor ?? Colors.white,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
