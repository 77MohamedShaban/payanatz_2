import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/reusable_component/custom_text_form_field.dart';
import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 36.h),
              _buildBreadcrumb(),
              SizedBox(height: 36.h),
              _buildActionsRow(context),
              SizedBox(height: 24.h),
              Expanded(
                child: _buildDepartmentsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        Text(
          'hr'.tr(),
          style: AppTextStyles.cairo24MediumGrey,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColors.textGrey,
          ),
        ),
        Text(
          'departments'.tr(),
          style: AppTextStyles.cairo24MediumBlack,
        ),
      ],
    );
  }

  Widget _buildActionsRow(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 48.h,
                child: CustomTextFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  hintText: 'search_hint'.tr(),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.hintGrey,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildButton(
                text: 'filter'.tr(),
                onPressed: () {},
                backgroundColor: Colors.white,
                borderColor: AppColors.borderGrey,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildButton(
                text: 'create_department'.tr(),
                onPressed: () {},
                backgroundColor: AppColors.hintGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required Color backgroundColor,
    Color? borderColor,
  }) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8.r),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.cairo14MediumBlack,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDepartmentsList() {
    final departments = [
      _Dept(name: 'marketing'.tr(), code: 'MKT', manager: 'Amro Handousa', count: 12, color: AppColors.deptBlue),
      _Dept(name: 'human_resources'.tr(), code: 'HR', manager: 'Sara Ali', count: 8, color: AppColors.deptGreen),
      _Dept(name: 'finance'.tr(), code: 'FIN', manager: 'Omar Adel', count: 6, color: AppColors.deptYellow),
      _Dept(name: 'sales'.tr(), code: 'SLS', manager: 'Mona Samir', count: 15, color: AppColors.deptRed),
      _Dept(name: 'development'.tr(), code: 'DEV', manager: 'Moataz Hamed', count: 21, color: AppColors.deptPurple),
      _Dept(name: 'design'.tr(), code: 'DSN', manager: 'Salma Ameer', count: 5, color: AppColors.deptOrange),
    ];

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 20.h),
      itemCount: departments.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) => _DepartmentCard(dept: departments[index]),
    );
  }
}

class _Dept {
  final String name;
  final String code;
  final String manager;
  final int count;
  final Color color;

  _Dept({
    required this.name,
    required this.code,
    required this.manager,
    required this.count,
    required this.color,
  });
}

class _DepartmentCard extends StatelessWidget {
  final _Dept dept;

  const _DepartmentCard({Key? key, required this.dept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
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
                color: dept.color,
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
                    Text(
                      dept.name,
                      style: AppTextStyles.cairo15MediumBlack,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
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
                      child: Icon(Icons.person, size: 16.sp, color: AppColors.hintGrey),
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
                          'manager'.tr(),
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
                  'employees_count'.tr(args: [dept.count.toString()]),
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
