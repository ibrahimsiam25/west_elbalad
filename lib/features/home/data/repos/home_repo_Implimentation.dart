import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:west_elbalad/core/errors/failure.dart';
import 'package:west_elbalad/core/errors/excptions.dart';
import 'package:west_elbalad/features/home/domian/repos/home_repo.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/home/data/data_source/home_local_data_source.dart';
import 'package:west_elbalad/features/home/data/data_source/home_remote_data_source.dart';

class HomeRepoImplimentation extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImplimentation(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<PhoneEntites>>> fetchPhonesData(
      {bool isRefreshed = false}) async {
    List<PhoneEntites> phonesData;
    try {
      if (isRefreshed) {
        print(
            "*****************Home*********Fetching data from Home remote data source due to refresh");
        phonesData = await homeRemoteDataSource.fetchPhonesData();
        return right(phonesData);
      }

      phonesData = await homeLocalDataSource.fetchPhonesData();

      if (phonesData.isNotEmpty) {
        print(
            "*******************Home********** information exists in local data source");
        return right(phonesData);
      }

      print(
          "*********************Home********* information does not exist in local data source, fetching from remote");
      phonesData = await homeRemoteDataSource.fetchPhonesData();
      return right(phonesData);
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
