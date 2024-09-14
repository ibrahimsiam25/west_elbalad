import 'package:get_it/get_it.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/admin/domain/repos/admin_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import 'package:west_elbalad/core/service/data_service.dart';
import 'package:west_elbalad/core/service/firestore_service.dart';
import 'package:west_elbalad/core/service/image_picker_serivce.dart';
import 'package:west_elbalad/core/service/firebase_auth_service.dart';
import 'package:west_elbalad/features/home/domian/repos/home_repo.dart';
import 'package:west_elbalad/features/admin/data/repos/admin_repo_impl.dart';
import 'package:west_elbalad/features/home/data/repos/home_repo_Implimentation.dart';
import '../../features/admin/presentation/manager/edit_in_store/edit_in_store_cubit.dart';
import 'package:west_elbalad/features/profile/presentation/manager/cubit/profile_cubit.dart';
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
    getIt.registerFactory<EditInStoreCubit>(() =>EditInStoreCubit(
      adminRepo: getIt.get<AdminRepo>(),
      imagePickerCubit:getIt.get<ImagePickerCubit>()
    ) );
    getIt.registerFactory<ProfileCubit>(() =>ProfileCubit(
      adminRepo: getIt.get<AdminRepo>(),
      imagePickerCubit:getIt.get<ImagePickerCubit>()
    ) );


  getIt.registerSingleton<HomeRepo>(
    HomeRepoImplimentation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
}
