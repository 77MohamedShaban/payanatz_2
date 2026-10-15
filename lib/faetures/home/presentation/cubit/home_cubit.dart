import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/get_departments_use_case.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetDepartmentsUseCase _getDepartmentsUseCase;

  HomeCubit(this._getDepartmentsUseCase) : super(HomeInitial());

  Future<void> getDepartments() async {
    emit(HomeLoading());
    try {
      final departments = await _getDepartmentsUseCase.execute();
      emit(HomeSuccess(departments));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
