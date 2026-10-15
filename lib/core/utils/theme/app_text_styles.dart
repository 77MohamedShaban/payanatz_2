import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class AppTextStyles {
  // Existing Styles
  static TextStyle regular16White = GoogleFonts.afacadFlux(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  
  static TextStyle regular16Black = GoogleFonts.pacifico(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static TextStyle roboto20White = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle roboto16Yellow = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: const Color(0xFFF6BD00),
  );

  static TextStyle roboto16White = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  // Evently Redesign Tokens (Poppins)
  static TextStyle poppins24SemiBoldBlue = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins14RegularGrey = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.secondaryGrey,
  );

  static TextStyle poppins14SemiBoldBlue = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins20MediumWhite = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );

  static TextStyle poppins16MediumBlue = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins18MediumBlue = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins14SemiBoldBlueUnderline = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.mainBlue,
    decoration: TextDecoration.underline,
  );

  // Departments & Create Department Tokens (Cairo)
  static TextStyle cairo24MediumGrey = GoogleFonts.cairo(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textGrey,
  );

  static TextStyle cairo24MediumBlack = GoogleFonts.cairo(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textBlack,
  );

  static TextStyle cairo13RegularHintGrey = GoogleFonts.cairo(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.hintGrey,
  );

  static TextStyle cairo14MediumBlack = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textBlack,
  );

  static TextStyle cairo15MediumBlack = GoogleFonts.cairo(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textBlack,
  );

  static TextStyle cairo11MediumGrey = GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textGrey,
  );

  static TextStyle cairo11RegularBlack = GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textBlack,
  );

  static TextStyle cairo10RegularGrey = GoogleFonts.cairo(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textGrey,
  );

  static TextStyle cairo11RegularGrey = GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textGrey,
  );

  static TextStyle cairo12RegularHintGrey = GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.hintGrey,
  );

  static TextStyle cairo12RegularBlack = GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textBlack,
  );

  static TextStyle cairo12RegularGrey = GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textGrey,
  );

  static TextStyle cairo10RegularRed = GoogleFonts.cairo(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.errorRed,
  );

  static TextStyle cairo18MediumBlack = GoogleFonts.cairo(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textBlack,
  );

  static TextStyle cairo20MediumBlack = GoogleFonts.cairo(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textBlack,
  );

  static TextStyle cairo18SemiBoldWhite = GoogleFonts.cairo(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
}
