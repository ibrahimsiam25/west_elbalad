import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/features/profile/presentation/views/widgets/profile_image.dart';

class ImagePickerOptions extends StatefulWidget {
  const ImagePickerOptions({super.key});

  @override
  State<ImagePickerOptions> createState() => _ImagePickerOptionsState();
}

class _ImagePickerOptionsState extends State<ImagePickerOptions> {
  File? image;
  final picker = ImagePicker();

  Future<void> openImagePicker(ImageSource source) async {
    final XFile? pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kRadius48),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          clipBehavior: Clip.antiAlias,
          context: context,
          builder: (context) {
            return Container(
              color: AppColors.white,
              padding: EdgeInsets.all(12.0.r),
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                    ),
                    title: Text(
                      'فتح معرض الصور',
                      style: AppStyles.title,
                    ),
                    onTap: () {
                      openImagePicker(
                        ImageSource.gallery,
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.camera_alt,
                    ),
                    title: Text(
                      'فتح الكاميرا',
                      style: AppStyles.title,
                    ),
                    onTap: () {
                      openImagePicker(
                        ImageSource.camera,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: ProfileImage(
        image: image,
      ),
    );
  }
}
