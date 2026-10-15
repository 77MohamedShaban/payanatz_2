import 'package:injectable/injectable.dart';
import '../../domain/entities/department.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/remote/home_remote_dao.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDao _remoteDao;

  HomeRepositoryImpl(this._remoteDao);

  @override
  Future<List<Department>> getDepartments() async {
    return await _remoteDao.getDepartments();
  }
}
