import 'package:flutter/material.dart';
import '../../domain/repos/admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/image_picker/image_picker_cubit.dart';
import '../manager/edit_in_store/edit_in_store_cubit.dart';
import 'package:west_elbalad/core/service/get_it_service.dart';
import 'widgets/edit_in_store/edit_in_store_view_body_bloc_consumer.dart';




class EditInStoreView extends StatelessWidget {
  const EditInStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditInStoreCubit(adminRepo: getIt<AdminRepo>(),),
        ),
        BlocProvider(create: (context) => ImagePickerCubit(getIt<AdminRepo>()),),
      ],
      child: Scaffold(
        body: const EditInStoreViewBodyBlocConsumer(),
      ),
    );
  }
}

