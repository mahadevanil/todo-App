import 'package:flutter/material.dart';
import 'package:todo/constants/dimensions/dimensions.dart';
import 'package:todo/constants/styles/colors.dart';

import '../../constants/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          //!------------------------------------(button color)
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(borderRadius: kRadius10),
        ),
        //!------------------------------------(button text and color)
        child: Kstyles().med18(text: text, color: kWhite),
      ),
    );
  }
}
