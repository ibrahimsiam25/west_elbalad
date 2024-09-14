import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:west_elbalad/core/errors/excptions.dart';
import 'package:west_elbalad/core/errors/failure.dart';
import 'package:west_elbalad/core/service/data_service.dart';
import 'package:west_elbalad/core/utils/backend_endpoints.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/home/domian/repos/home_repo.dart';

class HomeRepoImplimentation extends HomeRepo {
  final DatabaseService databaseService;
  HomeRepoImplimentation({required this.databaseService});
  @override
  Future<Either<Failure, List<PhoneEntites>>> fetchPhonesData() async {
    try {
      final phones =
          await databaseService.fetchAllPhones(BackendEndpoint.addPhone);
      return right(phones);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.fetchAllPhones: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }
}
