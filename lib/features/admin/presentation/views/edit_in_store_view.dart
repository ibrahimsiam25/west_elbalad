import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/edit_in_store/add_and_edit_in_store_view_body.dart';


class EditInStoreView extends StatelessWidget {
  const EditInStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: const AddAndEditInStoreViewBody(),
    );
  }
}