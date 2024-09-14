import 'dart:io';
import 'dart:developer';
import '../errors/excptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:west_elbalad/core/service/data_service.dart';
import '../../features/admin/data/model/user_informations_model.dart';
import 'package:west_elbalad/features/home/data/model/phones_model.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';
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
  Future<Map<String, Map<String, dynamic>>> fetchAllDocuments(
    String collectionName) async {
  try {
    // Fetch all documents from the specified collection
    final querySnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .get();

    // Convert documents into a Map<String, Map<String, dynamic>>
    final documentMap = <String, Map<String, dynamic>>{};
    for (var doc in querySnapshot.docs) {
      documentMap[doc.id] = doc.data();
    }

    return documentMap;
  } on FirebaseException catch (e) {
    // Handle Firestore-specific errors
    switch (e.code) {
      case 'permission-denied':
        log("Permission denied: ${e.message}");
        throw CustomException(
          message: 'ليس لديك صلاحية للوصول إلى هذه البيانات.',
        );
      case 'network-request-failed':
        log("Network error: ${e.message}");
        throw CustomException(
          message: 'تعذر الوصول إلى البيانات بسبب مشكلة في الشبكة. يرجى التحقق من اتصالك.',
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

  @override
  Future<List<PhoneEntites>> fetchAllPhones(String collectionName) async {
    try {
      final querySnapshot = await firestore.collection(collectionName).get();
      final phones = querySnapshot.docs.map((doc) {
        return PhoneModel.fromEntity(
          PhoneEntites(
            type: doc['type'],
            name: doc['name'],
            description: doc['description'],
            price: doc['price'],
            imageUrl: doc['imageUrl'],
          ),
        );
      }).toList();
      return phones;
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
