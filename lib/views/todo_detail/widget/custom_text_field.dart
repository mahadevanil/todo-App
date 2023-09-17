import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/constants/styles/colors.dart';

import '../../../constants/dimensions/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final bool? alignLabelWithHint;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.minLines,
    required this.hintText,
    required this.focusNode,
    required this.contentPadding,
    required this.alignLabelWithHint,
    required this.controller,
    required this.maxLines,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kBlack,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      focusNode: focusNode,
      controller: controller,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.sp,
        color: kBlack,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: alignLabelWithHint,
        contentPadding: contentPadding,
        counterText: "",
        isDense: true,
        fillColor: kWhite,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18.sp,
          color: kDarkGrey,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite),
            borderRadius: kRadius15),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite),
            borderRadius: kRadius15),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite),
            borderRadius: kRadius15),
      ),
    );
  }
}
