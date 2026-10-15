import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';

abstract class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
                if (message.isNotEmpty) ...[
                  SizedBox(height: 16.h),
                  Text(
                    message,
                    style: AppTextStyles.cairo14MediumBlack,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
    bool isError = false,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: REdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) ...[
                Text(
                  title,
                  style: AppTextStyles.cairo20MediumBlack,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
              ],
              Text(
                message,
                style: AppTextStyles.cairo14MediumBlack.copyWith(
                  color: AppColors.textGrey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  if (negActionName != null)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          negAction?.call();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: REdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: AppColors.borderGrey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          negActionName,
                          style: AppTextStyles.cairo14MediumBlack.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                      ),
                    ),
                  if (negActionName != null && posActionName != null)
                    SizedBox(width: 12.w),
                  if (posActionName != null)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          posAction?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isError ? AppColors.errorRed : AppColors.mainBlue,
                          padding: REdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          posActionName,
                          style: AppTextStyles.cairo14MediumBlack.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showSuccessDialog({
    required BuildContext context,
    required String message,
    required String title,
    required String buttonText,
    VoidCallback? onConfirm,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: REdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: REdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.deptGreen,
                  size: 50.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                title,
                style: AppTextStyles.cairo20MediumBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                message,
                style: AppTextStyles.cairo14MediumBlack.copyWith(
                  color: AppColors.textGrey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onConfirm?.call();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainBlue,
                    padding: REdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    buttonText,
                    style: AppTextStyles.cairo14MediumBlack.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
