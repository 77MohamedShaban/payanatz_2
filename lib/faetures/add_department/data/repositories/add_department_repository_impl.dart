import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:recap_project/faetures/add_department/data/models/department_model.dart';
import 'package:recap_project/faetures/add_department/domain/entities/department.dart';
import 'package:recap_project/faetures/add_department/domain/repositories/add_department_repository.dart';

@LazySingleton(as: AddDepartmentRepository)
class AddDepartmentRepositoryImpl implements AddDepartmentRepository {
  final FirebaseFirestore _firestore;

  AddDepartmentRepositoryImpl(this._firestore);

  @override
  Future<void> createDepartment(Department department) async {
    try {
      final model = DepartmentModel.fromEntity(department);
      await _firestore.collection('departments').add(model.toJson());
    } catch (e) {
      throw Exception('Failed to create department: ${e.toString()}');
    }
  }
}
