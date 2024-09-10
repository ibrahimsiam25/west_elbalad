import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/profile/presentation/manager/profile_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileImageCubit(),
      child: BlocBuilder<ProfileImageCubit, File?>(
        builder: (context, image) {
          return InkWell(
            borderRadius: BorderRadius.circular(kRadius48),
            onTap: () => context.read<ProfileImageCubit>().openImagePicker(),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius48),
              ),
              height: 128,
              width: 128,
              child: image != null
                  ? Image.file(image)
                  : Image.asset('assets/images/avatar.gif'),
            ),
          );
        },
      ),
    );
  }
}
