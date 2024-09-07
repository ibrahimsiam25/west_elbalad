import 'package:flutter/material.dart';
import '../../domian/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/Custom_appBar.dart';
import 'widgets/create_user_view_bloc_consumer.dart';
import '../../../../core/service/get_it_service.dart';
import '../manger/create_user/create_user_cubit.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/SignUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateUserCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: customAppBar(title: 'انشاء حساب', context: context),
        body:const CreateUserViewBlocConsumer(),
      ),
    );
  }
}

