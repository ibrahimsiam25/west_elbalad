import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/custom_show_image.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import '../../../../../core/widgets/show_image_picker_options.dart';


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
       showImagePickerOptions(context:context, onCameraPressed: () {
         openImagePicker(ImageSource.camera);
       }, onGalleryPressed: () {
         openImagePicker(ImageSource.gallery);
       });
      },
      child:CustomShowImage(
        image: image,
        radius: kRadius48,
        height: 128,
        width: 128,
        defaultImage: AppAssets.avatar,
      ),
    );
  }


}
