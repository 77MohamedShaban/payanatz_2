import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../models/department_model.dart';

abstract class HomeRemoteDao {
  Future<List<DepartmentModel>> getDepartments();
}

@Injectable(as: HomeRemoteDao)
class HomeRemoteDaoImpl implements HomeRemoteDao {
  final FirebaseFirestore _firestore;

  HomeRemoteDaoImpl(this._firestore);

  @override
  Future<List<DepartmentModel>> getDepartments() async {
    final querySnapshot = await _firestore.collection('departments').get();
    return querySnapshot.docs
        .map((doc) => DepartmentModel.fromFirestore(doc))
        .toList();
  }
}
