import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/reusable_component/custom_text_form_field.dart';
import 'package:recap_project/core/routes_manager/routes_name.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';
import 'package:recap_project/faetures/home/presentation/cubit/home_cubit.dart';

class HomeActionsRow extends StatelessWidget {
  final TextEditingController searchController;

  const HomeActionsRow({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 48.h,
                child: CustomTextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  hintText: AppStrings.searchHint,
                  onChanged: (value) {
                    context.read<HomeCubit>().searchDepartments(value);
                  },
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
                text: AppStrings.filter,
                onPressed: () {},
                backgroundColor: Colors.white,
                borderColor: AppColors.borderGrey,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildButton(
                text: AppStrings.createDepartment,
                onPressed: () async {
                  await Navigator.pushNamed(context, RoutesName.createDepartment);
                  if (context.mounted) {
                    context.read<HomeCubit>().getDepartments();
                  }
                },
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
}
