import 'package:get_it/get_it.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/admin/domain/repos/admin_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import 'package:west_elbalad/core/service/data_service.dart';
import 'package:west_elbalad/core/service/firestore_service.dart';
import 'package:west_elbalad/core/service/image_picker_serivce.dart';
import 'package:west_elbalad/core/service/firebase_auth_service.dart';
import 'package:west_elbalad/features/admin/data/repos/admin_repo_impl.dart';
import 'package:west_elbalad/features/admin/presentation/manager/image_picker/image_picker_cubit.dart';



final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ImagePickerService>(ImagePickerService());
    getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
      getIt.registerSingleton<AdminRepo>(
    AdminRepoImpl(
      imagePickerService: getIt.get<ImagePickerService>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
  getIt.registerFactory<ImagePickerCubit>(() => ImagePickerCubit(
    getIt.get<AdminRepo>()
  ));
  


}
