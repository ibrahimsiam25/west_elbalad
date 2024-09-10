import 'package:get_it/get_it.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import 'package:west_elbalad/core/service/data_service.dart';
import 'package:west_elbalad/core/service/firestore_service.dart';
import 'package:west_elbalad/core/service/firebase_auth_Service.dart';




final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
}
