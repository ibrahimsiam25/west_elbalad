import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:west_elbalad/features/home/data/model/phones_model.dart';
import 'package:west_elbalad/features/home/domian/repos/home_repo.dart';

part 'phones_data_state.dart';

class PhonesDataCubit extends Cubit<PhonesDataState> {
  PhonesDataCubit(this.homeRepo) : super(PhonesDataInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPhonesData() async {
    emit(PhonesDataLoading());
    final result = await homeRepo.fetchPhonesData();

    result.fold(
      (failure) => emit(PhonesDataFailure(message: failure.message)),
      (phones) => emit(PhonesDataSuccess(phonesList: phones)),
    );
  }
}
