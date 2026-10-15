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

import '../../faetures/home/data/data_sources/remote/home_remote_dao.dart'
    as _i100;
import '../../faetures/home/data/repositories/home_repository_impl.dart'
    as _i103;
import '../../faetures/home/domain/repositories/home_repository.dart'
    as _i102;
import '../../faetures/home/domain/use_cases/get_departments_use_case.dart'
    as _i104;
import '../../faetures/home/presentation/cubit/home_cubit.dart'
    as _i105;
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
    gh.factory<_i100.HomeRemoteDao>(
        () => _i100.HomeRemoteDaoImpl(gh<_i974.FirebaseFirestore>()));
    gh.factory<_i102.HomeRepository>(
        () => _i103.HomeRepositoryImpl(gh<_i100.HomeRemoteDao>()));
    gh.factory<_i104.GetDepartmentsUseCase>(
        () => _i104.GetDepartmentsUseCase(gh<_i102.HomeRepository>()));
    gh.factory<_i105.HomeCubit>(
        () => _i105.HomeCubit(gh<_i104.GetDepartmentsUseCase>()));
    return this;
  }
}

class _$FirebaseModule extends _i616.FirebaseModule {}
