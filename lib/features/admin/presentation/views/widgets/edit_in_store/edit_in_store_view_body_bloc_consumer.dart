import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/edit_in_store/edit_in_store_cubit.dart';
import 'package:west_elbalad/features/admin/presentation/views/widgets/edit_in_store/edit_in_store_view_body.dart';


class EditInStoreViewBodyBlocConsumer extends StatelessWidget {
  const EditInStoreViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<EditInStoreCubit ,EditInStoreState>(
      listener: (context, state) {
  
      },
      builder: (context, state) {
        if(state is EditInStoreSuccess) {
          
          return EditInStoreViewBody(phonesList: state.phonesList);
        }else if(state is EditInStoreFailure) {
          return Center(child: Text(state.message));
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}