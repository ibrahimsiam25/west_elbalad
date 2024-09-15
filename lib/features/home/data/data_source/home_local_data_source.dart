import '../../../../core/service/hive_service.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';


abstract class HomeLocalDataSource {
  Future<List<PhoneEntites>> fetchPhonesData();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  Future<List<PhoneEntites>> fetchPhonesData() async{
   var box = await openBox<PhoneEntites>(kPhoneDataHive);
    return box.values.toList();
  }

}