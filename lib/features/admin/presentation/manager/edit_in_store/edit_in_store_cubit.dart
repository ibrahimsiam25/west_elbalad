import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/admin/domain/repos/admin_repo.dart';


part 'edit_in_store_state.dart';

class EditInStoreCubit extends Cubit<EditInStoreState> {
  EditInStoreCubit() : super(EditInStoreInitial());

 //final AdminRepo adminRepo  ;

  // Future<void> fetchPhonesData() async {
  //   emit(EditInStoreLoading());
  //  // final result = await adminRepo.fetchPhonesData();

  //   result.fold(
  //     (failure) => emit(EditInStoreFailure(message: failure.message)),
  //     (phones) => emit(EditInStoreSuccess(phonesList: phones)),
  //   );
  // }
}
