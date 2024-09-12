import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/excptions.dart';
import '../../../../core/service/data_service.dart';
import 'package:west_elbalad/core/errors/failure.dart';
import 'package:west_elbalad/core/utils/backend_endpoints.dart';
import 'package:west_elbalad/features/admin/domain/repos/admin_repo.dart';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';




class AdminRepoImpl extends AdminRepo{
  final DatabaseService databaseService;

  AdminRepoImpl({required this.databaseService});


  @override
  Future<Either<Failure, List<UserInformationsEntity>>> fetchAllUsers() async{
 try {
    final user = await databaseService.fetchAllDecuments(BackendEndpoint.addUserData);
    return right(user);
  }on CustomException catch (e) {
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
}