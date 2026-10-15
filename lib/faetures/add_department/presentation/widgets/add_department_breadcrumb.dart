import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';

class AddDepartmentBreadcrumb extends StatelessWidget {
  const AddDepartmentBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppStrings.hr, style: AppTextStyles.cairo24MediumGrey.copyWith(fontSize: 18)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColors.textGrey,
          ),
        ),
        Text(AppStrings.departments, style: AppTextStyles.cairo24MediumGrey.copyWith(fontSize: 18)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColors.textGrey,
          ),
        ),
        Text(AppStrings.createDepartment, style: AppTextStyles.cairo18MediumBlack),
      ],
    );
  }
}
