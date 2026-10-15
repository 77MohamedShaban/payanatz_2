import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';

import '../../../../core/utils/theme/app_colors.dart';

class DepartmentDropdownField extends StatelessWidget {
  final String hint;
  final String? value;
  final VoidCallback onTap;

  const DepartmentDropdownField({
    super.key,
    required this.hint,
    this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        padding: REdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.borderGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? hint,
              style: value == null
                  ? AppTextStyles.cairo13RegularHintGrey
                  : AppTextStyles.cairo14MediumBlack,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.hintGrey,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
