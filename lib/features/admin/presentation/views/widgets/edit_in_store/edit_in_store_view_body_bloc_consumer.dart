import 'edit_in_store_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';
import 'package:west_elbalad/core/constants/app_assets.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import '../../../manager/edit_in_store/edit_in_store_cubit.dart';
import 'package:west_elbalad/core/functions/build_message_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:west_elbalad/features/admin/presentation/views/widgets/edit_in_store/image_picker_bloc_builder.dart';






class EditInStoreViewBodyBlocConsumer extends StatelessWidget {
  const EditInStoreViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditInStoreCubit, EditInStoreState>(
listener: (context, state) {
  if (state is EditInStoreSuccess) {
    buildMessageBar(context, "تمت اضافةالهاتف بنجاح");
    Navigator.pop(context);
    
  }else if(state is EditInStoreFailure){
    buildMessageBar(context, state.message);
  }
},
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is EditInStoreLoading ? true : false,
            child: Column(
              children: [
                CustomAppBar(
                  title: "اضافة هاتف",
                ),
           imagePickerBlocBuilder(radius: kRadius48, width:150 , height: 200, defaultImage: AppAssets.avatar),
                EditInStoreViewBody(),
              ],
            ));
      },
    );
  }
}
