import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';
import 'package:recap_project/faetures/home/domain/entities/department.dart';

class DepartmentCard extends StatelessWidget {
  final Department dept;

  const DepartmentCard({super.key, required this.dept});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 6.w,
            child: Container(
              decoration: BoxDecoration(
                color: Color(dept.colorHex),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 12.w, 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dept.name, style: AppTextStyles.cairo15MediumBlack),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tagBackground,
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: Text(
                        dept.code,
                        style: AppTextStyles.cairo11MediumGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 13.r,
                      backgroundColor: AppColors.fieldGrey,
                      child: Icon(
                        Icons.person,
                        size: 16.sp,
                        color: AppColors.hintGrey,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dept.manager,
                          style: AppTextStyles.cairo11RegularBlack,
                        ),
                        Text(
                          AppStrings.manager,
                          style: AppTextStyles.cairo10RegularGrey,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Divider(height: 1, color: AppColors.borderGrey),
                SizedBox(height: 4.h),
                Text(
                  AppStrings.employeesCount.replaceFirst(
                    "{}",
                    dept.employeesCount.toString(),
                  ),
                  style: AppTextStyles.cairo10RegularGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
