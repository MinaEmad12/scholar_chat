// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hint_text;
  final ElevatedButton? suffix_icon;
  final TextEditingController? controller;
  final bool password;
  final String? Function(String? data)? validator;
  final Color? color_hint;
  final Color? textFieldColor;
  final double? size_hint;
  final Color? color_eye;

  final double? horizontal_Padding;
  final double? borderRadius;
  final double? vertical_Padding;
  final Widget? prefix;
  final Widget? label;
  final bool? height;
  final void Function(String value)? onChanged;
  final DataOutlineInputBorder? dataOutlineInputBorder;

  const CustomTextFormField({
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
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText = widget.password;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0)),
      height: widget.height == true ? 60.h : null,
      child: TextFormField(
        onChanged: widget.onChanged,
        cursorColor: widget.dataOutlineInputBorder?.fillcolor,
        cursorHeight: 20.7.h,
        cursorWidth: 2.3.w,
        validator: widget.validator,
        //TextStyle
        style: TextStyle(
          fontSize: 19.sp,
          color: widget.textFieldColor,
        ),
        obscureText: obscureText,
        controller: widget.controller,
        //Decoration
        decoration: InputDecoration(
          prefixIcon: widget.prefix,
          label: widget.label,
          fillColor: widget.dataOutlineInputBorder?.fillcolor,
          filled: widget.dataOutlineInputBorder?.filled ?? false,
          hintText: widget.hint_text,
          suffixIcon: widget.password == false
              ? null
              : Padding(
                  padding: EdgeInsets.only(top: 2, right: 14.w, left: 4.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: obscureText == true
                        ? Icon(
                            Icons.visibility_off,
                            size: 25.sp,
                            color: widget.color_eye ??
                                const Color.fromARGB(255, 97, 97, 97),
                          )
                        : Icon(
                            Icons.remove_red_eye,
                            size: 25.sp,
                            color: widget.color_eye ??
                                const Color.fromARGB(255, 97, 97, 97),
                          ),
                  ),
                ),
          //HintStyle
          hintStyle: TextStyle(
            fontSize: widget.size_hint ?? 15.sp,
            color:
                widget.color_hint ?? const Color.fromARGB(214, 131, 130, 130),
            fontWeight: FontWeight.bold,
          ),
          //ContentPadding
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.horizontal_Padding ?? 13,
            vertical: widget.vertical_Padding ?? 14,
          ),
          //EnabledBorder
          enabledBorder: Out_Line().Outline_Input_Border(
            color: widget.dataOutlineInputBorder?.fillcolor,
            border: widget.dataOutlineInputBorder?.border,
            width: widget.dataOutlineInputBorder?.width,
          ),
          //FocusedBorder
          focusedBorder: Out_Line().Outline_Input_Border(
            color: widget.dataOutlineInputBorder?.fillcolor,
            border: widget.dataOutlineInputBorder?.border,
            width: widget.dataOutlineInputBorder?.width,
          ),
          // ErrorBorder
          errorBorder: Out_Line().Outline_Input_Border_erore(
            border: widget.dataOutlineInputBorder?.border,
            width: widget.dataOutlineInputBorder?.width,
          ),
          // FocusedErrorBorder
          focusedErrorBorder: Out_Line().Outline_Input_Border_erore(
            border: widget.dataOutlineInputBorder?.border,
            width: widget.dataOutlineInputBorder?.width,
          ),
        ),
      ),
    );
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
