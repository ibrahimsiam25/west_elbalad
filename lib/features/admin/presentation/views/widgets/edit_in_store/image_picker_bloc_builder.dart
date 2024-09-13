import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_show_image.dart';
import '../../../manager/image_picker/image_picker_cubit.dart';
import '../../../../../../core/widgets/show_image_picker_options.dart';

File? imageAddPhone;
class imagePickerBlocBuilder extends StatelessWidget {
  const imagePickerBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerCubit, ImagePickerState>(
      builder: (context, state) {
        if (state is ImagePickerInitial) {
          return InkWell(
              borderRadius: BorderRadius.circular(
                  48), // Updated kRadius48 to a fixed value
              onTap: () {
                showImagePickerOptions(
                  context: context,
                  onCameraPressed: ()async {
      imageAddPhone   =     await      context
                        .read<ImagePickerCubit>()
                        .openImagePickerFromCamera();
                  },
                  onGalleryPressed: ()async {
               imageAddPhone   =     await        context
                        .read<ImagePickerCubit>()
                        .openImagePickerFromGallery();
                  },
                );
              },
              child: CustomShowImage(
                image: context.read<ImagePickerCubit>().image,
                radius: kRadius48, // Updated kRadius48 to a fixed value
                width: 128.0.w,
                height: 180.0.h,
                defaultImage:
                    AppAssets.avatar, // Updated default image to a placeholder
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
