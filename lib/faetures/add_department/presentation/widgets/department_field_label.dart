import 'package:flutter/material.dart';
import 'package:recap_project/core/utils/theme/app_text_styles.dart';

class DepartmentFieldLabel extends StatelessWidget {
  final String label;

  const DepartmentFieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppTextStyles.cairo14MediumBlack);
  }
}
