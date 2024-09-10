import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/features/profile/presentation/manager/profile_image.dart';
import 'package:west_elbalad/features/profile/presentation/views/widgets/popup_menu_item_row.dart';
import 'package:west_elbalad/features/profile/presentation/views/widgets/profile_image.dart';

class ImagePickerOptions extends StatelessWidget {
  const ImagePickerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileImageCubit(),
      child: BlocBuilder<ProfileImageCubit, File?>(
        builder: (context, image) {
          return PopupMenuButton<ImageSource>(
            color: AppColors.white,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<ImageSource>>[
                PopupMenuItem(
                  value: ImageSource.camera,
                  child: PopupMenuItemRow(
                    icon: Icons.camera_alt_rounded,
                    text: 'فتح الكاميرة',
                  ),
                ),
                PopupMenuItem(
                  value: ImageSource.gallery,
                  child: PopupMenuItemRow(
                    icon: Icons.image,
                    text: 'فتح المعرض',
                  ),
                ),
              ];
            },
            onSelected: (ImageSource value) {
              context.read<ProfileImageCubit>().openImagePicker(value);
            },
            child: ProfileImage(
              image: image,
            ),
          );
        },
      ),
    );
  }
}
