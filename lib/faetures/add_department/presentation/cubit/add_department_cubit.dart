import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recap_project/faetures/add_department/domain/entities/department.dart';
import 'package:recap_project/faetures/add_department/domain/usecases/create_department_usecase.dart';

part 'add_department_state.dart';

@injectable
class AddDepartmentCubit extends Cubit<AddDepartmentState> {
  final CreateDepartmentUseCase _createDepartmentUseCase;

  AddDepartmentCubit(this._createDepartmentUseCase) : super(AddDepartmentInitial());

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
    
    final department = Department(
      name: name,
      nameArabic: nameArabic,
      code: code,
      color: selectedColor.value,
      manager: selectedManager,
      description: description,
    );

    try {
      await _createDepartmentUseCase(department);
      emit(AddDepartmentSuccess());
    } catch (e) {
      emit(AddDepartmentError(e.toString()));
    }
  }
}
