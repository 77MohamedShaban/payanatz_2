import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';

class DepartmentDescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const DepartmentDescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: 4,
        style: AppTextStyles.cairo14MediumBlack,
        decoration: InputDecoration(
          hintText: AppStrings.descriptionHint,
          hintStyle: AppTextStyles.cairo13RegularHintGrey,
          contentPadding: REdgeInsets.all(16),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
