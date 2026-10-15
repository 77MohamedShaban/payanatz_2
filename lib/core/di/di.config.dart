// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../faetures/add_department/data/repositories/add_department_repository_impl.dart'
    as _i810;
import '../../faetures/add_department/domain/repositories/add_department_repository.dart'
    as _i648;
import '../../faetures/add_department/domain/usecases/create_department_usecase.dart'
    as _i1020;
import '../../faetures/add_department/presentation/cubit/add_department_cubit.dart'
    as _i606;
import '../../faetures/home/data/data_sources/remote/home_remote_dao.dart'
    as _i882;
import '../../faetures/home/data/repositories/home_repository_impl.dart'
    as _i968;
import '../../faetures/home/domain/repositories/home_repository.dart' as _i675;
import '../../faetures/home/domain/use_cases/get_departments_use_case.dart'
    as _i680;
import '../../faetures/home/presentation/cubit/home_cubit.dart' as _i218;
import 'firebase_module.dart' as _i616;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i648.AddDepartmentRepository>(
      () => _i810.AddDepartmentRepositoryImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i882.HomeRemoteDao>(
      () => _i882.HomeRemoteDaoImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i1020.CreateDepartmentUseCase>(
      () => _i1020.CreateDepartmentUseCase(gh<_i648.AddDepartmentRepository>()),
    );
    gh.factory<_i675.HomeRepository>(
      () => _i968.HomeRepositoryImpl(gh<_i882.HomeRemoteDao>()),
    );
    gh.factory<_i606.AddDepartmentCubit>(
      () => _i606.AddDepartmentCubit(gh<_i1020.CreateDepartmentUseCase>()),
    );
    gh.factory<_i680.GetDepartmentsUseCase>(
      () => _i680.GetDepartmentsUseCase(gh<_i675.HomeRepository>()),
    );
    gh.factory<_i218.HomeCubit>(
      () => _i218.HomeCubit(gh<_i680.GetDepartmentsUseCase>()),
    );
    return this;
  }
}

class _$FirebaseModule extends _i616.FirebaseModule {}
