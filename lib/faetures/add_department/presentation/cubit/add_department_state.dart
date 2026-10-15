part of 'add_department_cubit.dart';

abstract class AddDepartmentState {}

class AddDepartmentInitial extends AddDepartmentState {}

class AddDepartmentLoading extends AddDepartmentState {}

class AddDepartmentSuccess extends AddDepartmentState {}

class AddDepartmentError extends AddDepartmentState {
  final String message;
  AddDepartmentError(this.message);
}

class AddDepartmentColorChanged extends AddDepartmentState {
  final Color color;
  AddDepartmentColorChanged(this.color);
}

class AddDepartmentManagerChanged extends AddDepartmentState {
  final String manager;
  AddDepartmentManagerChanged(this.manager);
}
