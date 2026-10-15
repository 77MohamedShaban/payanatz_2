import '../entities/department.dart';

abstract class HomeRepository {
  Future<List<Department>> getDepartments();
}
