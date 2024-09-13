part of 'edit_in_store_cubit.dart';

@immutable
sealed class EditInStoreState {}

final class EditInStoreInitial extends EditInStoreState {}
final class EditInStoreLoading extends EditInStoreState {}
final class EditInStoreSuccess extends EditInStoreState {}
final class EditInStoreImageChanged extends EditInStoreState {
  final File? image;
  EditInStoreImageChanged({required this.image});
}
final class EditInStoreFailure extends EditInStoreState {
  final String message;
  EditInStoreFailure({required this.message});
}
