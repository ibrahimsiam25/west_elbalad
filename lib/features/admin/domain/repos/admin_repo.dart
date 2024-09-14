import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';


abstract class AdminRepo {
  Future<Either<Failure, List<UserInformationsEntity>>> fetchAllUsers();
  Future<Either<Failure, List<PhoneEntites>>> fetchAllPhones();
  Future<void> uploadPhoneData(File image, Map<String, dynamic> data);
  Future<File?> openImagePickerFromCamera();
  Future<File?> openImagePickerFromGallery();
}
