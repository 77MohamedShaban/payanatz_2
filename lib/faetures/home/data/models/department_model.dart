import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/department.dart';

class DepartmentModel extends Department {
  const DepartmentModel({
    required super.id,
    required super.name,
    required super.code,
    required super.manager,
    required super.employeesCount,
    required super.colorHex,
  });

  factory DepartmentModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DepartmentModel(
      id: doc.id,
      name: data['name'] ?? '',
      code: data['code'] ?? '',
      manager: data['manager'] ?? '',
      employeesCount: data['employeesCount'] ?? 0,
      colorHex: data['colorHex'] ?? 0xFF000000,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'code': code,
      'manager': manager,
      'employeesCount': employeesCount,
      'colorHex': colorHex,
    };
  }
}
