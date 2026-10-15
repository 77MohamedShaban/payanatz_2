import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String id;
  final String name;
  final String code;
  final String manager;
  final int employeesCount;
  final int colorHex;

  const Department({
    required this.id,
    required this.name,
    required this.code,
    required this.manager,
    required this.employeesCount,
    required this.colorHex,
  });

  @override
  List<Object?> get props => [id, name, code, manager, employeesCount, colorHex];
}
