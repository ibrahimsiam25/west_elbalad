import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/widgets/custom_app_bar.dart';
import 'package:west_elbalad/features/admin/domain/entities/user_informations_entites.dart';
import 'package:west_elbalad/features/admin/presentation/manager/user_informations/user_informations_cubit.dart';

class UsersInformationsViewBody extends StatelessWidget {
  const UsersInformationsViewBody(
      {super.key, required this.usersInformationList});
  final List<UserInformationsEntity> usersInformationList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'عرض المستخدمين',
          icon: Icons.refresh,
          onTap: () {
            BlocProvider.of<UserInformationsCubit>(context)
                .fetchUserInformations();
          },
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            itemCount: usersInformationList.length,
            itemBuilder: (context, index) {
              final user = usersInformationList[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    Text(
                      user.name,
                      style:
                          AppStyles.subtitle.copyWith(color: AppColors.white),
                    ),
                    Text(
                      user.email,
                      style:
                          AppStyles.subtitle.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
