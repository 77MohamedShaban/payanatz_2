import 'package:injectable/injectable.dart';
import '../entities/department.dart';
import '../repositories/home_repository.dart';

@injectable
class GetDepartmentsUseCase {
  final HomeRepository _repository;

  GetDepartmentsUseCase(this._repository);

  Future<List<Department>> execute() {
    return _repository.getDepartments();
  }
}
