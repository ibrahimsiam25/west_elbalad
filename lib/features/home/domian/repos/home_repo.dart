import 'package:dartz/dartz.dart';
import 'package:west_elbalad/core/errors/failure.dart';
import 'package:west_elbalad/features/home/data/model/phones_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PhoneModel>>> fetchPhonesData();
}
