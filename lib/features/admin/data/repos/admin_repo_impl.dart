import 'dart:io';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/excptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/service/data_service.dart';
import '../../../home/data/model/phones_model.dart';
import 'package:west_elbalad/core/errors/failure.dart';
import '../../../home/domian/entites/phone_entites.dart';
import '../../../../core/service/image_picker_serivce.dart';
import 'package:west_elbalad/core/utils/backend_endpoints.dart';
import 'package:west_elbalad/features/admin/domain/repos/admin_repo.dart';
import 'package:west_elbalad/features/auth/domain/entites/user_entity.dart';
import 'package:west_elbalad/features/admin/data/model/user_informations_model.dart';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';

class AdminRepoImpl extends AdminRepo {
  final DatabaseService databaseService;
  final ImagePickerService imagePickerService;

  AdminRepoImpl(
      {required this.imagePickerService, required this.databaseService});

  @override
  Future<Either<Failure, List<UserInformationsEntity>>> fetchAllUsers() async {
    try {
    final Map<String, Map<String, dynamic>> usersData =
        await databaseService.fetchAllDocuments(BackendEndpoint.addUserData);
    

    final List<UserInformationsEntity> usersList = usersData.entries.map((entry) {
      return UserInformationsModel.fromMap(entry.value, entry.key);
    }).toList();
      return right(usersList);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.fetchAllUsers: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<void> uploadPhoneData(File image, Map<String, dynamic> data) async {
    String imageUrl = await databaseService.uploadImage(
      image: image,
      path: "phones/${image.path}",
    );

    PhoneEntites phoneEntites = PhoneEntites(

      type: data["phoneType"],
      name: data["phoneName"],
      description: data["phoneDescription"],
      imageUrl: imageUrl,
      price: double.parse(data["phonePrice"]),
    );
    databaseService.addData(
        path: BackendEndpoint.addPhone,
        data: PhoneModel.fromEntity(phoneEntites).toMap());
  }

  @override
  Future<File?> openImagePickerFromCamera() {
    return imagePickerService.uploadImageFromCamera();
  }

  @override
  Future<File?> openImagePickerFromGallery() {
    return imagePickerService.uploadImageFromGallery();
  }
  
  @override
Future<Either<Failure, List<PhoneEntites>>> fetchAllPhones() async {
  try {
    final Map<String, Map<String, dynamic>> phoneData =
        await databaseService.fetchAllDocuments(BackendEndpoint.getPhone);
      var phone =PhoneMultiFactorGenerator
    return right(phoneList);
  } on CustomException catch (e) {
    return left(ServerFailure(e.message));
  } catch (e) {
    log('Exception in fetchAllPhones: ${e.toString()}');
    return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
  }
}
}
