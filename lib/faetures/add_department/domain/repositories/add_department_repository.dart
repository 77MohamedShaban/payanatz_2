import 'package:recap_project/faetures/add_department/domain/entities/department.dart';

abstract class AddDepartmentRepository {
  Future<void> createDepartment(Department department);
}
