import 'dart:io';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';

abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docuementId,
  });
  Future<List<UserInformationsEntity>> fetchAllDecuments(String collectionName);
  Future<List<PhoneEntites>> fetchAllPhones(String collectionName);
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId});
  Future<String> uploadImage({required File image, required String path});
}
