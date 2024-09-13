import 'edit_in_store_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';
import '../../../manager/edit_in_store/edit_in_store_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:west_elbalad/features/admin/presentation/views/widgets/edit_in_store/image_picker_bloc_builder.dart';



class EditInStoreViewBodyBlocConsumer extends StatelessWidget {
  const EditInStoreViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditInStoreCubit, EditInStoreState>(
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is EditInStoreLoading ? true : false,
            child: Column(
              children: [
                CustomAppBar(
                  title: "اضافة هاتف",
                ),
             imagePickerBlocBuilder(),
                EditInStoreViewBody(),
              ],
            ));
      },
    );
  }
}
