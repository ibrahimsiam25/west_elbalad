import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:west_elbalad/core/widgets/custom_button.dart';
import '../../../manager/image_picker/image_picker_cubit.dart';
import '../../../../../../core/widgets/custom_number_field.dart';
import '../../../manager/edit_in_store/edit_in_store_cubit.dart';
import 'package:west_elbalad/core/functions/build_error_bar.dart';
import 'package:west_elbalad/core/widgets/custom_text_field.dart';


class EditInStoreViewBody extends StatefulWidget {
  const EditInStoreViewBody({super.key});

  @override
  State<EditInStoreViewBody> createState() => _EditInStoreViewBodyState();
}

class _EditInStoreViewBodyState extends State<EditInStoreViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String phoneType, phoneName, phoneDescription, phonePrice;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 16.0),
          CustomTextFormField(
            onSaved: (value) {
              phoneName = value!;
            },
            hintText: "اسم الشركة",
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16.0),
          CustomTextFormField(
            onSaved: (value) {
              phoneType = value!;
            },
            hintText: "نوع الهاتف",
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16.0),
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
          SizedBox(height: 16.0),
          CustomButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (context.read<ImagePickerCubit>().image != null) {
                  context
                      .read<EditInStoreCubit>()
                      .uploadPhoneData(context.read<ImagePickerCubit>().image, {
                    "phoneType": phoneType,
                    "phoneName": phoneName,
                    "phoneDescription": phoneDescription,
                    "phonePrice": phonePrice
                  });
                } else {
                  buildErrorBar(context, "يجب تحديد صورة للهاتف");
                }
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: "اضافة الهاتف",
          ),
        ],
      ),
    );
  }
}
