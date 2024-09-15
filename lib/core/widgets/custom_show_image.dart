import 'dart:io';
import 'package:flutter/material.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';

class CustomShowImage extends StatelessWidget {
  final File? image;
  final double height;
  final double width;
  final String defaultImage;
  const CustomShowImage({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
    required this.defaultImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius88),
      ),
      height: height,
      width: width,
      child: image != null
          ? Image.file(
              image!,
              fit: BoxFit.fill,
            )
          : Image.asset(
              defaultImage,
              fit: BoxFit.fill,
            ),
    );
  }
}
