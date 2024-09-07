import 'package:dartz/dartz.dart';
import '../entites/user_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUser(
    String email,
    String password,
    String name,
  );

  Future<Either<Failure, UserEntity>> signIn(
    String email,
    String password,
  );

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future addUserData({required UserEntity userEntity});
}
