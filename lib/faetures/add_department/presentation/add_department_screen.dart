import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/di/di.dart';
import 'package:recap_project/core/reusable_component/custom_text_form_field.dart';
import 'package:recap_project/core/utils/app_strings.dart';
import 'package:recap_project/core/utils/app_validator.dart';
import 'package:recap_project/core/utils/dialog_utils.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/faetures/add_department/presentation/cubit/add_department_cubit.dart';
import 'package:recap_project/faetures/add_department/presentation/widgets/add_department_breadcrumb.dart';
import 'package:recap_project/faetures/add_department/presentation/widgets/department_field_label.dart';
import 'package:recap_project/faetures/add_department/presentation/widgets/department_dropdown_field.dart';
import 'package:recap_project/faetures/add_department/presentation/widgets/department_color_picker.dart';
import 'package:recap_project/faetures/add_department/presentation/widgets/department_description_field.dart';
import 'package:recap_project/faetures/add_department/presentation/widgets/add_department_action_buttons.dart';

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
              buttonText: AppStrings.ok,
              onConfirm: () => Navigator.pop(context),
            );
          } else if (state is AddDepartmentError) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              message: state.message,
              posActionName: AppStrings.ok,
              isError: true,
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 36.h),
                    const AddDepartmentBreadcrumb(),
                    SizedBox(height: 15.h),
                    DepartmentFieldLabel(label: AppStrings.departmentName),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: AppStrings.textHereHint,
                      validator: AppValidator.validateRequired,
                    ),
                    SizedBox(height: 16.h),
                    DepartmentFieldLabel(
                      label: AppStrings.departmentNameArabic,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: _nameArabicController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: AppStrings.textHereHint,
                      validator: AppValidator.validateRequired,
                    ),
                    SizedBox(height: 16.h),
                    DepartmentFieldLabel(label: AppStrings.code),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: _codeController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: AppStrings.textHereHint,
                      validator: AppValidator.validateDepartmentCode,
                    ),
                    SizedBox(height: 16.h),
                    DepartmentFieldLabel(label: AppStrings.manager),
                    SizedBox(height: 8.h),
                    BlocBuilder<AddDepartmentCubit, AddDepartmentState>(
                      buildWhen: (previous, current) =>
                          current is AddDepartmentManagerChanged,
                      builder: (context, state) {
                        final cubit = context.read<AddDepartmentCubit>();
                        return DepartmentDropdownField(
                          hint: AppStrings.selectManagerHint,
                          value: cubit.selectedManager,
                          onTap: () => cubit.changeManager(
                            AppStrings.defaultManagerName,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    DepartmentFieldLabel(label: AppStrings.color),
                    SizedBox(height: 12.h),
                    DepartmentColorPicker(availableColors: _availableColors),
                    SizedBox(height: 16.h),
                    DepartmentFieldLabel(label: AppStrings.description),
                    SizedBox(height: 8.h),
                    DepartmentDescriptionField(
                      controller: _descriptionController,
                    ),
                    SizedBox(height: 40.h),
                    Builder(
                      builder: (context) => AddDepartmentActionButtons(
                        onSubmit: () {
                          if (_formKey.currentState!.validate()) {
                            final cubit = context.read<AddDepartmentCubit>();
                            DialogUtils.showMessage(
                              context: context,
                              title: AppStrings.creatingDepartmentTitle,
                              message:
                                  AppStrings.creatingDepartmentConfirmation,
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
                        },
                        onDiscard: () => Navigator.pop(context),
                      ),
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
}
