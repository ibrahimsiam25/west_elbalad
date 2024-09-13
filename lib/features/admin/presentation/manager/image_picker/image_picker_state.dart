part of 'image_picker_cubit.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {
  File? image;

  ImagePickerInitial( this.image);
}

