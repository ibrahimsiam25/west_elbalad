import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/home/domian/repos/home_repo.dart';
import 'package:west_elbalad/features/admin/domain/repos/admin_repo.dart';

part 'remove_from_store_state.dart';

class RemoveFromStoreCubit extends Cubit<RemoveFromStoreState> {
  RemoveFromStoreCubit(this.adminRepo, this.homeRepo) : super(RemoveFromStoreInitial());

  final AdminRepo adminRepo;
  final HomeRepo homeRepo ;
  Future<void> fetchPhonesData({bool isRefreshed = false}) async {
    emit(RemoveFromStoreLoading());
    final result = await homeRepo.fetchPhonesData(isRefreshed: isRefreshed);

    result.fold(
      (failure) => emit(RemoveFromStoreFailure(message: failure.message)),
      (phones) => emit(RemoveFromStoreSuccess(phonesList: phones)),
    );
  }

  Future<void> deletePhoneData(String id) async {
    final result = await adminRepo.deletePhoneData(id);
    result.fold(
      (failure) => emit(RemoveFromStoreFailure(message: failure.message)),
      (Null) {
        emit(removePhoneSuccess());
        fetchPhonesData(  isRefreshed: true);
      },
    );
  }
}
