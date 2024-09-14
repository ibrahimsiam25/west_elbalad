import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:west_elbalad/features/admin/presentation/manager/edit_in_store/edit_in_store_cubit.dart';
import 'package:west_elbalad/features/admin/presentation/views/widgets/edit_in_store/edit_in_store_view_body_bloc_consumer.dart';

class EditInStoreView extends StatelessWidget {
  const EditInStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => EditInStoreCubit(),
      child: EditInStoreViewBodyBlocConsumer(),
    );
  }
}