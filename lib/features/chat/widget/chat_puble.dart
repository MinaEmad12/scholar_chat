import 'package:flutter/material.dart';
import 'package:scholar_chat/features/chat/class/puble_class.dart';
import 'package:scholar_chat/features/chat/model/model_message.dart';
import 'package:scholar_chat/shared/custom_text.dart';


class ChatPuble extends StatelessWidget {
  final Color color;
  final PaddingPuble? paddingPuble;
  final RadiusPuble? radiusPuble;
  final TextPuble textPuble;
  final MarginPuble? marginPuble;
  final AlignmentGeometry? alignment;
  ModelMessage modelMessage;
  ChatPuble({
    Key? key,
    this.paddingPuble,
    this.radiusPuble,
    required this.textPuble,
    this.marginPuble,
    this.alignment,
    required this.modelMessage, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topLeft,
      child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radiusPuble?.bottomLeft ?? 0),
                topLeft: Radius.circular(radiusPuble?.topLeft ?? 0),
                topRight: Radius.circular(radiusPuble?.topRight ?? 0),
                bottomRight: Radius.circular(radiusPuble?.bottomRight ?? 0),
              )),
          margin: EdgeInsets.symmetric(
            horizontal: marginPuble?.marginHorizontal ?? 0,
            vertical: marginPuble?.marginVertical ?? 0,
          ),
          padding: EdgeInsets.only(
            top: paddingPuble?.paddingTop ?? 0,
            bottom: paddingPuble?.paddingBottom ?? 0,
            right: paddingPuble?.paddingRight ?? 0,
            left: paddingPuble?.paddingLeft ?? 0,
          ),
          child: CustomText(
            textFont: modelMessage.message,
            textSize: textPuble.textSize,
            alignment: textPuble.alignment,
            fontWeight1: textPuble.fontWeight1,
            fontWeight2: textPuble.fontWeight2,
            textColor: textPuble.textColor,
          )),
    );
  }
}
