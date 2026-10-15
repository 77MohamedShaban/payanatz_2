import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String? id;
  final String name;
  final String nameArabic;
  final String code;
  final String? manager;
  final int color;
  final String? description;

  const Department({
    this.id,
    required this.name,
    required this.nameArabic,
    required this.code,
    this.manager,
    required this.color,
    this.description,
  });

  @override
  List<Object?> get props => [id, name, nameArabic, code, manager, color, description];
}
