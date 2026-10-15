import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/di/di.dart';
import 'package:recap_project/core/reusable_component/custom_text_form_field.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/dialog_utils.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';
import 'package:recap_project/faetures/add_department/presentation/cubit/add_department_cubit.dart';

class AddDepartmentScreen extends StatefulWidget {
  const AddDepartmentScreen({Key? key}) : super(key: key);

  @override
  State<AddDepartmentScreen> createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nameArabicController = TextEditingController();
  final _codeController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<Color> _availableColors = [
    AppColors.deptBlue,
    AppColors.deptGreen,
    AppColors.deptYellow,
    AppColors.deptRed,
    AppColors.deptPurple,
    AppColors.deptOrange,
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _nameArabicController.dispose();
    _codeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showCreateConfirmation(BuildContext context, AddDepartmentCubit cubit) {
    DialogUtils.showMessage(
      context: context,
      title: AppStrings.creatingDepartmentTitle,
      message: AppStrings.creatingDepartmentConfirmation,
      posActionName: AppStrings.yes,
      posAction: () {
        cubit.createDepartment(
          name: _nameController.text,
          nameArabic: _nameArabicController.text,
          code: _codeController.text,
          description: _descriptionController.text,
        );
      },
      negActionName: AppStrings.no,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddDepartmentCubit>(),
      child: BlocListener<AddDepartmentCubit, AddDepartmentState>(
        listener: (context, state) {
          if (state is AddDepartmentLoading) {
            DialogUtils.showLoading(context: context, message: "");
          } else if (state is AddDepartmentSuccess) {
            DialogUtils.hideLoading(context);
            DialogUtils.showSuccessDialog(
              context: context,
              title: AppStrings.successful,
              message: AppStrings.createSuccessMessage,
              buttonText: "Ok",
              onConfirm: () {
                Navigator.pop(context);
              },
            );
          } else if (state is AddDepartmentError) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              message: state.message,
              posActionName: "Ok",
              isError: true,
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundGrey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppColors.textBlack, size: 20.sp),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              AppStrings.createDepartment,
              style: AppTextStyles.cairo18MediumBlack,
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel(AppStrings.departmentName),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: AppStrings.textHereHint,
                      validator: (value) =>
                          value == null || value.isEmpty ? AppStrings.fieldRequired : null,
                    ),
                    SizedBox(height: 16.h),
                    _buildLabel(AppStrings.departmentNameArabic),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: _nameArabicController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: AppStrings.textHereHint,
                      validator: (value) =>
                          value == null || value.isEmpty ? AppStrings.fieldRequired : null,
                    ),
                    SizedBox(height: 16.h),
                    _buildLabel(AppStrings.code),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: _codeController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: AppStrings.textHereHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) return AppStrings.fieldRequired;
                        if (!RegExp(r'^[A-Z]{2,5}$').hasMatch(value)) return AppStrings.codeValidationHint;
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    _buildLabel(AppStrings.manager),
                    SizedBox(height: 8.h),
                    BlocBuilder<AddDepartmentCubit, AddDepartmentState>(
                      buildWhen: (previous, current) => current is AddDepartmentManagerChanged,
                      builder: (context, state) {
                        final cubit = context.read<AddDepartmentCubit>();
                        return _buildDropdownField(
                          hint: AppStrings.selectManagerHint,
                          value: cubit.selectedManager,
                          onTap: () {
                            cubit.changeManager("Moataz Hamed");
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    _buildLabel(AppStrings.color),
                    SizedBox(height: 12.h),
                    BlocBuilder<AddDepartmentCubit, AddDepartmentState>(
                      buildWhen: (previous, current) => current is AddDepartmentColorChanged,
                      builder: (context, state) {
                        final cubit = context.read<AddDepartmentCubit>();
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: _availableColors.map((color) {
                            final isSelected = cubit.selectedColor == color;
                            return GestureDetector(
                              onTap: () => cubit.changeColor(color),
                              child: Container(
                                width: 44.w,
                                height: 44.h,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: isSelected ? Border.all(color: AppColors.mainBlue, width: 3.w) : null,
                                ),
                                child: isSelected ? Icon(Icons.check, color: AppColors.white, size: 24.sp) : null,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    _buildLabel(AppStrings.description),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: AppColors.borderGrey),
                      ),
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: 4,
                        style: AppTextStyles.cairo14MediumBlack,
                        decoration: InputDecoration(
                          hintText: AppStrings.descriptionHint,
                          hintStyle: AppTextStyles.cairo13RegularHintGrey,
                          contentPadding: REdgeInsets.all(16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Builder(
                      builder: (context) {
                        return Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: REdgeInsets.symmetric(vertical: 14),
                                  side: const BorderSide(color: AppColors.borderGrey),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                ),
                                child: Text(
                                  AppStrings.discard,
                                  style: AppTextStyles.cairo18MediumBlack.copyWith(color: AppColors.textGrey),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _showCreateConfirmation(context, context.read<AddDepartmentCubit>());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainBlue,
                                  padding: REdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: AppTextStyles.cairo14MediumBlack,
    );
  }

  Widget _buildDropdownField({required String hint, String? value, required VoidCallback onTap}) {
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
            Icon(Icons.keyboard_arrow_down, color: AppColors.hintGrey, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
