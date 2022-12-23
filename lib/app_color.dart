import 'package:flutter/material.dart';

class AppColors {
  final randomColors = [
    AppColors.customBlue,
    AppColors.textColor,
    AppColors.redBtnBg,
    AppColors.customGreen,
    AppColors.darkGreen,
    AppColors.success,
    AppColors.customPurple,
    AppColors.mild,
    AppColors.primaryOrange,
    AppColors.textGrey,
    AppColors.grey2,
  ];
  static const colorShimmer = Color(0xffE6E6E6);
  static const primaryOrange = Color(0xffFE8137);
  static const ratingBarColor = Color(0xffE79E39);
  static const customYellow = Color(0xffFFC107);
  static const primaryGreen = Color(0xffDADE66);
  static const circleBg = Color(0xffECEFF1);
  static const divider = Color(0xffC4C4C4);
  static const textColor = Color(0xff010202);
  static const appBg = Color(0xffF6F7FB);
  static const indicatorColor = Color(0xff92F8C9);
  static const customPurple = Color(0xff7344BE);
  static const placeHolder = Color(0xffF8F8F9);
  static const buttonGrey = Color(0xffF2F2F2);
  static const grey8 = Color(0xffEFF2F7);
  static const btnBg = Color(0xff010202);
  static const redBtnBg = Color(0xffD93832);
  static const customFabRed = Color(0xffD93832);
  final Color customRed = Color(0xffEE0000);
  static const facebookBlue = Color(0xff3A5695);
  static const greyBg = Color(0xffF8F8F9);
  static const grey4 = Color(0xff757886);
  static const greyMild = Color(0xffEEEEEE);
  static const background = Color(0xffE5E5E5);
  static const blackText = Color(0xff0F0627);
  static const textGrey = Color(0xff4A4C56);
  static const healaBlack = Color(0xff2D2F39);
  static const greyBg2 = Color(0xffF6F7FB);
  static const healaGreen = Color(0xff7EEDBA);
  static const customGreen = Color(0xff3EA584);
  static const customBlue = Color(0xff3E5EA9);
  static const darkGreen = Color(0xff32846A);
  static const googleRed = Color(0xffE05139);
  static const fontColor = Color(0xff4A4A4A);
  static const grey = Color(0xff757886);
  static const mild = Color(0xff32BBD9);
  static const grey1 = Color(0xff757886);
  static const dividerColor = Color(0xffEAEDF5);
  static const greyBgPage = Color(0xffF6F7FB);
  static const grey2 = Color(0xff303F4C);
  static const grey3 = Color(0xff4A4C56);
  static const error = Color(0xffFF5E5E);
  static const success = Color(0xff35CF4E);
  static const circleGrey = Color(0xffF0F0F0);
  static const lightBlue = Color(0xffE1E7F4);
  static const solidGrey = Color(0xffF8F8F8);
  static const borderGrey = Color(0xffEAEAEA);
  static const doctorFillGrey = Color(0xffFAFAFA);
  static const textBorderGrey = Color(0xffE0E0E0);
  static const pharmacyGrey = Color(0xffF5F5F5);
  static const blackShade = Color(0xff656565);
  static const hmoPlan = Color(0xffF79B01);
  static const infoBlue = Color(0xff5C88EF);
  static const faintBorderColor = Color(0xffECEFF6);
  static const redText = Color(0xffF16063);
}

final ThemeData appThemeLight = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: const Color(0xffffffff),
  brightness: Brightness.light,
  primaryColor: AppColors.primaryOrange,
  accentColor: AppColors.primaryOrange,
  errorColor: AppColors.error,
  buttonBarTheme: const ButtonBarThemeData(alignment: MainAxisAlignment.center),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: AppColors.fontColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: AppColors.grey1,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: AppColors.grey1,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: AppColors.error,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    isDense: false,
    contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryOrange,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.grey2,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.grey1,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.grey1,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
);
