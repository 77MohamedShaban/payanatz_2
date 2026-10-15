import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';
import 'package:recap_project/core/routes_manager/routes_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_project/faetures/home/presentation/cubit/home_cubit.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        height: 500.h,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.fieldGrey,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(
                Icons.square_rounded,
                size: 80.sp,
                color: AppColors.hintGrey,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              AppStrings.noDepartmentsYet,
              style: AppTextStyles.cairo20MediumBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                AppStrings.noDepartmentsSubtitle,
                style: AppTextStyles.cairo14MediumBlack.copyWith(
                  color: AppColors.textGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: 200.w,
              child: ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(
                    context,
                    RoutesName.createDepartment,
                  );
                  if (context.mounted) {
                    context.read<HomeCubit>().getDepartments();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.hintGrey,
                  padding: REdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppStrings.createDepartment,
                  style: AppTextStyles.cairo14MediumBlack
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
