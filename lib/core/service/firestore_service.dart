import 'dart:io';
import 'dart:developer';
import '../errors/excptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:west_elbalad/core/service/data_service.dart';
import '../../features/admin/data/model/user_informations_model.dart';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }

  @override
  Future<List<UserInformationsEntity>> fetchAllDecuments(
      String collectionName) async {
    try {
      final querySnapshot = await firestore.collection(collectionName).get();

      final users = querySnapshot.docs.map((doc) {
        return UserInformationsModel.fromMap(doc.data(), doc.id);
      }).toList();
      return users;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          log("Permission denied: ${e.message}");
          throw CustomException(
            message: 'ليس لديك صلاحية للوصول إلى هذه البيانات.',
          );
        case 'network-request-failed':
          log("Network error: ${e.message}");
          throw CustomException(
            message:
                'تعذر الوصول إلى البيانات بسبب مشكلة في الشبكة. يرجى التحقق من اتصالك.',
          );
        default:
          log("FirebaseException: ${e.message}");
          throw CustomException(
            message: 'حدث خطأ أثناء جلب البيانات من Firestore.',
          );
      }
    } catch (e) {
      // Handle any other exceptions
      log("Unexpected error: ${e.toString()}");
      throw CustomException(
        message: 'حدث خطأ غير متوقع. حاول مرة أخرى لاحقًا.',
      );
    }
  }

  @override
  Future<String> uploadImage(
      {required File image, required String path}) async {
    try {
      var refStorage = storage.ref(path);
      await refStorage.putFile(image);
      var url = await refStorage.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          log("Permission denied: ${e.message}");
          throw CustomException(
            message: 'ليس لديك صلاحية للوصول إلى هذه البيانات.',
          );
        case 'network-request-failed':
          log("Network error: ${e.message}");
          throw CustomException(
            message:
                'تعذر الوصول إلى البيانات بسبب مشكلة في الشبكة. يرجى التحقق من اتصالك.',
          );
        default:
          log("FirebaseException: ${e.message}");
          throw CustomException(
            message: 'حدث خطأ أثناء جلب البيانات من Firestore.',
          );
      }
    } catch (e) {
      // Handle any other exceptions
      log("Unexpected error: ${e.toString()}");
      throw CustomException(
        message: 'حدث خطأ غير متوقع. حاول مرة أخرى لاحقًا.',
      );
    }
  }
}
