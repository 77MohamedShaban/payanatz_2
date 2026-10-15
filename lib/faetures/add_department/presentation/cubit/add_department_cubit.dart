import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'add_department_state.dart';

@injectable
class AddDepartmentCubit extends Cubit<AddDepartmentState> {
  AddDepartmentCubit() : super(AddDepartmentInitial());

  Color selectedColor = const Color(0xFF3B82F6);
  String? selectedManager;

  void changeColor(Color color) {
    selectedColor = color;
    emit(AddDepartmentColorChanged(color));
  }

  void changeManager(String manager) {
    selectedManager = manager;
    emit(AddDepartmentManagerChanged(manager));
  }

  void createDepartment({
    required String name,
    required String nameArabic,
    required String code,
    required String description,
  }) async {
    emit(AddDepartmentLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    emit(AddDepartmentSuccess());
  }
}
