import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';





abstract class AdminRepo {
  Future<Either<Failure, List<UserInformationsEntity>>> fetchAllUsers();
}