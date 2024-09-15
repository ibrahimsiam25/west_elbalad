import '../model/user_informations_model.dart';
import '../../../../core/service/data_service.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/service/hive_service.dart';
import 'package:west_elbalad/core/utils/backend_endpoints.dart';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';






abstract class UserInformationsRemoteDataSource {
  Future<List<UserInformationsEntity>> fetchUsersData();
}
class UserInformationsRemoteDataSourceImpl
    extends UserInformationsRemoteDataSource {
      final DatabaseService databaseService;

  UserInformationsRemoteDataSourceImpl({required this.databaseService});
  @override
  Future<List<UserInformationsEntity>> fetchUsersData()async {
      final List<Map<String, dynamic>> usersData =
          await databaseService.fetchAllDocuments(BackendEndpoint.addUserData);
   final List<UserInformationsEntity> usersList = usersData.map((data) {
        return UserInformationsModel.fromMap(data);
      }).toList();
      saveData<UserInformationsEntity>(usersList,kUserInformationsHive );
      return usersList;
  }
}