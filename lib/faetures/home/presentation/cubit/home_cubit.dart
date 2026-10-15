import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/get_departments_use_case.dart';
import '../../domain/entities/department.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetDepartmentsUseCase _getDepartmentsUseCase;
  List<Department> _allDepartments = [];

  HomeCubit(this._getDepartmentsUseCase) : super(HomeInitial());

  Future<void> getDepartments() async {
    emit(HomeLoading());
    try {
      _allDepartments = await _getDepartmentsUseCase.execute();
      emit(HomeSuccess(_allDepartments));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void searchDepartments(String query) {
    if (query.isEmpty) {
      emit(HomeSuccess(_allDepartments));
    } else {
      final filtered = _allDepartments.where((dept) {
        return dept.name.toLowerCase().contains(query.toLowerCase()) ||
            dept.code.toLowerCase().contains(query.toLowerCase()) ||
            dept.manager.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(HomeSuccess(filtered));
    }
  }
}
