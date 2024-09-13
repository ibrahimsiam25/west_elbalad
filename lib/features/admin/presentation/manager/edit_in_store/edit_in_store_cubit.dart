import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../image_picker/image_picker_cubit.dart';
import 'package:west_elbalad/features/admin/domain/repos/admin_repo.dart';




part 'edit_in_store_state.dart';

class EditInStoreCubit extends Cubit<EditInStoreState> {
  EditInStoreCubit({required this.adminRepo, required this.imagePickerCubit}) : super(EditInStoreInitial());
  final AdminRepo adminRepo;
  final ImagePickerCubit imagePickerCubit;
  Future<void> uploadPhoneData(File? image,Map<String, dynamic> data)async {
    emit(EditInStoreLoading());
    try {
      await adminRepo.uploadPhoneData(image!, data);
      emit(EditInStoreSuccess());
    } on Failure catch (e) {
      emit(EditInStoreFailure(message: e.message));
    }
  }

}
