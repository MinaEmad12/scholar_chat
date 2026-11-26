// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? hint_text;
  final ElevatedButton? suffix_icon;
  final TextEditingController? controller;
  final bool password;
  final String? Function(String? data)? validator;
  final Color? color_hint;
  final Color? textFieldColor;
  final double? size_hint;
  final Color? color_eye;
  final void Function(String value)? onSubmitted;
  final double? horizontal_Padding;
  final double? borderRadius;
  final double? vertical_Padding;
  final Widget? prefix;
  final Widget? label;
  final bool? height;
  final void Function(String value)? onChanged;
  final DataOutlineInputBorder? dataOutlineInputBorder;
  const CustomTextField({
    Key? key,
    this.hint_text,
    this.controller,
    this.suffix_icon,
    this.password = false,
    this.validator,
    this.color_hint,
    this.size_hint,
    this.color_eye,
    this.horizontal_Padding,
    this.vertical_Padding,
    this.prefix,
    this.label,
    this.height = false,
    this.dataOutlineInputBorder,
    this.textFieldColor,
    this.onChanged,
    this.borderRadius,
    this.onSubmitted,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        textDirection: TextDirection.rtl,
        cursorColor: dataOutlineInputBorder?.fillcolor,
        cursorHeight: 20.7.h,
        cursorWidth: 2.3.w,
        //TextStyle
        style: TextStyle(fontSize: 19.sp, color: textFieldColor, height: 1.5),
        controller: controller,    
        //Decoration
        decoration: InputDecoration(
          prefixIcon: prefix,
          label: label,
          fillColor: dataOutlineInputBorder?.fillcolor,
          filled: dataOutlineInputBorder?.filled ?? false,
          hintText: hint_text,
          //HintStyle
          hintStyle: TextStyle(
            fontSize: size_hint ?? 15.sp,
            color: color_hint ?? const Color.fromARGB(214, 131, 130, 130),
            fontWeight: FontWeight.bold,
          ),
          //ContentPadding
          contentPadding: const EdgeInsets.only(
            top: 14,
            bottom: 14,
            left: 10,
            right: 12,
          ),
          //EnabledBorder
          enabledBorder: Out_Line().Outline_Input_Border(
            color: dataOutlineInputBorder?.fillcolor,
            border: dataOutlineInputBorder?.border,
            width: dataOutlineInputBorder?.width,
          ),
          //FocusedBorder
          focusedBorder: Out_Line().Outline_Input_Border(
            color: dataOutlineInputBorder?.fillcolor,
            border: dataOutlineInputBorder?.border,
            width: dataOutlineInputBorder?.width,
          ),
          // ErrorBorder
          errorBorder: Out_Line().Outline_Input_Border_erore(
            border: dataOutlineInputBorder?.border,
            width: dataOutlineInputBorder?.width,
          ),
          // FocusedErrorBorder
          focusedErrorBorder: Out_Line().Outline_Input_Border_erore(
            border: dataOutlineInputBorder?.border,
            width: dataOutlineInputBorder?.width,
          ),
        ));
  }
}

//class
class Out_Line {
  OutlineInputBorder Outline_Input_Border(
      {Color? color, double? border, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(border ?? 0),
      borderSide: BorderSide(
          color: color ?? const Color.fromARGB(0, 200, 197, 197),
          width: width ?? 0),
    );
  }

  OutlineInputBorder Outline_Input_Border_erore(
      {double? border, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(border ?? 0),
      borderSide: BorderSide(color: Colors.red, width: width ?? 0),
    );
  }
}

class DataOutlineInputBorder {
  final bool? filled;
  final double? border;
  final double? width;
  final Color? fillcolor;
  DataOutlineInputBorder(
      {this.border, this.width, this.fillcolor, this.filled});
}
