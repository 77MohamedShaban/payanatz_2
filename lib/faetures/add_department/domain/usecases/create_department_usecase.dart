import 'package:injectable/injectable.dart';
import 'package:recap_project/faetures/add_department/domain/entities/department.dart';
import 'package:recap_project/faetures/add_department/domain/repositories/add_department_repository.dart';

@injectable
class CreateDepartmentUseCase {
  final AddDepartmentRepository _repository;

  CreateDepartmentUseCase(this._repository);

  Future<void> call(Department department) async {
    return await _repository.createDepartment(department);
  }
}
