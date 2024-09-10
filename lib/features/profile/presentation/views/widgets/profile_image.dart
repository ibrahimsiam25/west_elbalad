import 'dart:io';
import 'package:flutter/material.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';

class ProfileImage extends StatelessWidget {
  final File? image;
  const ProfileImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius48),
      ),
      height: 128,
      width: 128,
      child: image != null
          ? Image.file(
              image!,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'AppAssets/images/avatar.gif',
              fit: BoxFit.fill,
            ),
    );
  }
}
