import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundGrey,
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.white),
    dividerTheme: DividerThemeData(color: AppColors.strokeGrey, thickness: 1.h),
    colorScheme: ColorScheme.light(
      primary: AppColors.blackBase,
      onPrimary: AppColors.white,
      surface: AppColors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.cairo14MediumBlack,
      bodyMedium: AppTextStyles.poppins24SemiBoldBlue,
      bodySmall: AppTextStyles.cairo13RegularHintGrey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.backgroundDark),
    dividerTheme: DividerThemeData(color: AppColors.secondaryGrey, thickness: 1.h),
    colorScheme: ColorScheme.dark(
      primary: AppColors.blackBase,
      onPrimary: AppColors.white,
      surface: AppColors.backgroundDark,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.regular16Black.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.poppins24SemiBoldBlue.copyWith(color: AppColors.white),
      bodySmall: AppTextStyles.cairo14MediumBlack.copyWith(color: AppColors.white),
    ),
  );
}
