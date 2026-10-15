import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';

class AddDepartmentActionButtons extends StatelessWidget {
  final VoidCallback onSubmit;
  final VoidCallback onDiscard;

  const AddDepartmentActionButtons({
    super.key,
    required this.onSubmit,
    required this.onDiscard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onDiscard,
            style: OutlinedButton.styleFrom(
              padding: REdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppColors.borderGrey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              AppStrings.discard,
              style: AppTextStyles.cairo18MediumBlack.copyWith(
                color: AppColors.textGrey,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainBlue,
              padding: REdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: Text(
              AppStrings.submit,
              style: AppTextStyles.cairo18SemiBoldWhite,
            ),
          ),
        ),
      ],
    );
  }
}
