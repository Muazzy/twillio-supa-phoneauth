import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';

class TextStyling {
  TextStyling._();

  static TextStyle extraLargeBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 26.sp,
    color: AppColors.black,
  );
  static TextStyle extraLargeRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 26.sp,
    color: AppColors.black,
  );
  static TextStyle large2Bold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 24.sp, color: AppColors.black);
  static TextStyle large2Regular = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 24.sp, color: AppColors.black);
  static TextStyle largeBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.black);
  static TextStyle largeRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 20.sp, color: AppColors.black);
  static TextStyle mediumBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 16.sp, color: AppColors.black);
  static TextStyle mediumRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black);
  static TextStyle smallBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 12.sp, color: AppColors.black);
  static TextStyle smallRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 12.sp, color: AppColors.black);
  static TextStyle extraSmallBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 8.sp, color: AppColors.black);
  static TextStyle extraSmallRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 8.sp, color: AppColors.black);
}
