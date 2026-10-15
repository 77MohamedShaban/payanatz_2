import 'package:recap_project/faetures/add_department/domain/entities/department.dart';

class DepartmentModel extends Department {
  const DepartmentModel({
    super.id,
    required super.name,
    required super.nameArabic,
    required super.code,
    super.manager,
    required super.color,
    super.description,
  });

  factory DepartmentModel.fromEntity(Department entity) {
    return DepartmentModel(
      id: entity.id,
      name: entity.name,
      nameArabic: entity.nameArabic,
      code: entity.code,
      manager: entity.manager,
      color: entity.color,
      description: entity.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameArabic': nameArabic,
      'code': code,
      'manager': manager ?? '',
      'colorHex': color, // Changed from 'color' to 'colorHex' to match Home model
      'employeesCount': 0, // Added to match Home model expectation
      'description': description,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }

  factory DepartmentModel.fromJson(Map<String, dynamic> json, String id) {
    return DepartmentModel(
      id: id,
      name: json['name'] as String,
      nameArabic: json['nameArabic'] as String,
      code: json['code'] as String,
      manager: json['manager'] as String?,
      color: (json['colorHex'] ?? json['color']) as int,
      description: json['description'] as String?,
    );
  }
}
