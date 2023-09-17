import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/constants/styles/colors.dart';

class Kstyles {
  //!---<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Lato_light >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Text light10({
    required String text,
    Color color = kBlack,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 10.sp,
          color: color,
          fontWeight: FontWeight.w300),
    );
  }

  //!---<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Lato_Reg >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Text reg9({
    required String text,
    Color color = kBlack,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 9.sp,
          color: color,
          fontWeight: FontWeight.w400),
    );
  }

  //!---<<<<< <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Lato_Medium >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>
  Text med14({
    required String text,
    Color color = kBlack,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.sp,
          color: color,
          fontWeight: FontWeight.w500),
    );
  }

  Text med16(
      {required String text,
      Color color = kBlack,
      TextDecoration? decoration}) {
    return Text(
      text,
      style: TextStyle(
          decoration: decoration,
          fontFamily: 'Lato',
          fontSize: 16.sp,
          color: color,
          fontWeight: FontWeight.w500),
    );
  }

  Text med18({
    required String text,
    Color color = kBlack,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18.sp,
          color: color,
          fontWeight: FontWeight.w500),
    );
  }

  //!---<<<<< <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Lato_Semi_Bold >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>
  Text semiBold18({
    required String text,
    Color color = kBlack,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18.sp,
          color: color,
          fontWeight: FontWeight.w600),
    );
  }

//!---<<<<< <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Lato_Bold >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>
  Text bold18({
    required String text,
    Color color = kBlack,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18.sp,
          color: color,
          fontWeight: FontWeight.w700),
    );
  }

  Text bold20(
      {required String text,
      Color color = kBlack,
      TextAlign? textAlign,
      TextDecoration? decoration}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          decoration: decoration,
          fontFamily: 'Lato',
          fontSize: 20.sp,
          color: color,
          fontWeight: FontWeight.w700),
    );
  }

  Text bold30({
    required String text,
    Color color = kBlack,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 30.sp,
          color: color,
          fontWeight: FontWeight.w700),
    );
  }
}
