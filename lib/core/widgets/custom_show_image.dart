import 'dart:io';
import 'package:flutter/material.dart';

class CustomShowImage extends StatelessWidget {
  final File? image;
  final double  radius;
  final double height;
  final double width;
  final String defaultImage;
  const CustomShowImage({Key? key, required this.image, required this. radius, required this.height, required this.width, required this.defaultImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( radius),
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
