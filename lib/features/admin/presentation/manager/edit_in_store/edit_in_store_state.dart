part of 'edit_in_store_cubit.dart';

@immutable
sealed class EditInStoreState {}

final class EditInStoreInitial extends EditInStoreState {}
final class EditInStoreLoading extends EditInStoreState {}
final class EditInStoreSuccess extends EditInStoreState {

   final List<PhoneEntites> phonesList;
  EditInStoreSuccess({required this.phonesList});
}
final class EditInStoreFailure extends EditInStoreState {

  final String message;
  EditInStoreFailure({required this.message});
}
