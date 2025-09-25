import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    this.txt,
    this.txtclr,
    this.fntsize,
    this.fontWeight,
    this.textDecoration,
    this.textOverflow,
    this.maxline,
  });
  final String? txt;
  final Color? txtclr;
  final double? fntsize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxline ?? 1,
      txt ?? "",
      style: TextStyle(
        color: txtclr ?? Colors.black,
        fontSize: fntsize ?? 18,
        fontWeight: fontWeight ?? FontWeight.w300,
        decoration: textDecoration ?? TextDecoration.none,
        overflow: textOverflow,
      ),
    );
  }
}
