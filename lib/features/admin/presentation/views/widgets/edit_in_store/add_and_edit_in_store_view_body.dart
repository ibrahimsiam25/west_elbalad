import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../../../core/constants/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import '../../../../../../core/utils/backend_endpoints.dart';
import 'package:west_elbalad/core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_show_image.dart';
import '../../../../../../core/widgets/custom_number_field.dart';
import 'package:west_elbalad/core/service/firestore_service.dart';
import 'package:west_elbalad/core/functions/build_error_bar.dart';
import 'package:west_elbalad/core/widgets/custom_text_field.dart';
import '../../../../../../core/service/image_picker_serivce.dart';
import '../../../../../../core/widgets/show_image_picker_options.dart';
import 'package:west_elbalad/features/home/data/model/phones_model.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';

class AddAndEditInStoreViewBody extends StatefulWidget {
  const AddAndEditInStoreViewBody({super.key});

  @override
  State<AddAndEditInStoreViewBody> createState() =>
      _AddAndEditInStoreViewBodyState();
}

class _AddAndEditInStoreViewBodyState extends State<AddAndEditInStoreViewBody> {
  File? image;
  final ImagePickerService _imagePickerService = ImagePickerService();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String phoneType, phoneName, phoneDescription,phonePrice;

  final FireStoreService fireStoreService = FireStoreService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Method to open image picker and update the state
  Future<void> openImagePicker(ImageSource source) async {
    final selectedImage = await _imagePickerService.openImagePicker(source);
    if (selectedImage != null) {
      setState(() {
        image = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Updated padding to a fixed value
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(

            children: [
              CustomAppBar(
          title: "اضافة هاتف",
    
   
        ),
              InkWell(
                borderRadius: BorderRadius.circular(
                    48), // Updated kRadius48 to a fixed value
                onTap: () {
                  showImagePickerOptions(
                    context: context,
                    onCameraPressed: () {
                      openImagePicker(ImageSource.camera);
                    },
                    onGalleryPressed: () {
                      openImagePicker(ImageSource.gallery);
                    },
                  );
                },
                child: CustomShowImage(
                  image: image,
                  radius: kRadius48, // Updated kRadius48 to a fixed value
                  width: 128.0.w,
                  height: 180.0.h,
                  defaultImage: AppAssets
                      .avatar, // Updated default image to a placeholder
                ),
              ),
              SizedBox(height: 16.0), // Updated .h to a fixed value
              CustomTextFormField(
                onSaved: (value) {
                  phoneType = value!;
                },
                hintText: "اسم الشركة",
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16.0), // Updated .h to a fixed value
              CustomTextFormField(
                onSaved: (value) {
                  phoneName = value!;
                },
                hintText: "اسم الهاتف",
                textInputType: TextInputType.text,
              ),

              SizedBox(height: 16.0), // Updated .h to a fixed value
              CustomNumberField(
                onSaved: (value) {
                  phonePrice = value!;
                },
                hintText: "سعر الهاتف",
         
              ),
              SizedBox(height: 16.0),
              CustomTextFormField(
                onSaved: (value) {
                  phoneDescription = value!;
                },
                hintText: "موصفات الهاتف",
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16.0), // Updated .h to a fixed value
              CustomButton(
                onPressed: () async {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      String imageUrl = await fireStoreService.uploadImage(
                          image: image!,
                          path: "phones/${basename(image!.path)}");
                      PhoneEntites phoneEntites = PhoneEntites(
                        type: phoneType,
                        name: phoneName,
                        description: phoneDescription,
                        imageUrl: imageUrl,
                        price: double.parse(phonePrice),
                      );
                      fireStoreService.addData(
                          path: BackendEndpoint.addPhone,
                          data: PhoneModel.fromEntity(phoneEntites).toMap());
                      buildErrorBar(context, "تم الاضافة بنجاح");
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    buildErrorBar(context, "يجب تحديد صورة الهاتف اولاً");
                  }
                },
                text: "اضافة الهاتف",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
