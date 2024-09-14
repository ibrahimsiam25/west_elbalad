import 'dart:io';

abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docuementId,
  });
 Future<List<Map<String, dynamic>>> fetchAllDocuments(String collectionName);

  Future<bool> checkIfDataExists(
      {required String path, required String docuementId});
  Future<String> uploadImage({required File image, required String path});
}
