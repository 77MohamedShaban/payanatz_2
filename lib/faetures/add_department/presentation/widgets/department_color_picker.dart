import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/utils/theme/app_colors.dart';
import 'package:recap_project/faetures/add_department/presentation/cubit/add_department_cubit.dart';

class DepartmentColorPicker extends StatelessWidget {
  final List<Color> availableColors;

  const DepartmentColorPicker({super.key, required this.availableColors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDepartmentCubit, AddDepartmentState>(
      buildWhen: (previous, current) => current is AddDepartmentColorChanged,
      builder: (context, state) {
        final cubit = context.read<AddDepartmentCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: availableColors.map((color) {
            final isSelected = cubit.selectedColor == color;
            return GestureDetector(
              onTap: () => cubit.changeColor(color),
              child: Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: AppColors.mainBlue, width: 3.w)
                      : null,
                ),
                child: isSelected
                    ? Icon(Icons.check, color: AppColors.white, size: 24.sp)
                    : null,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
