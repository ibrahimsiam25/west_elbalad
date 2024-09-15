import '../model/phones_model.dart';
import '../../domian/entites/phone_entites.dart';
import '../../../../core/service/hive_service.dart';
import '../../../../core/service/data_service.dart';
import '../../../../core/utils/backend_endpoints.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';


abstract class HomeRemoteDataSource {
  Future<List<PhoneEntites>> fetchPhonesData();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final DatabaseService databaseService;
  HomeRemoteDataSourceImpl({required this.databaseService});
  @override
  Future<List<PhoneEntites>> fetchPhonesData() async {
   var phonesData = await databaseService.fetchAllDocuments(BackendEndpoint.getPhone);
       final List<PhoneEntites> phoneList = phonesData.map((data) {
        return PhoneModel.fromMap(data);
      }).toList();
   saveData<PhoneEntites>(phoneList, kPhoneDataHive);
 return phoneList;
  }
}




