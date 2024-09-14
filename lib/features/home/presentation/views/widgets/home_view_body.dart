import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/home/presentation/manager/phones_filter/filter_cubit.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/filter_list.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/selected_phones.dart';

var selectedType = 'samsung';

class HomeViewBody extends StatelessWidget {
  final List<PhoneEntites> phones;
  const HomeViewBody({
    super.key,
    required this.phones,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => FilterListCubit(),
        child: Column(
          children: [
            //AppBar
            HomeAppbar(), //Banner
            //حط الاعلان هنا يعم ابراهيم
            //لسة دا هيتظبط
            SizedBox(height: 16.0.h),
            BlocBuilder<FilterListCubit, int>(
              builder: (context, state) {
                final uniquePhoneTypes =
                    phones.map((phone) => phone.type).toSet().toList();
                return Column(
                  children: [
                    //Filters
                    Filters(
                      phones: phones,
                    ),
                    SizedBox(height: 16.0.h),
                    //Selected phones
                    Wrap(
                      spacing: 16.0.w,
                      children: [
                        ...phones
                            .where(
                              (phone) => phone.type == uniquePhoneTypes[state],
                            )
                            .map((phone) => SelectedPhones(phones: phone))
                            .toList(),
                        //For alighnment
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kHorizontalPadding),
                          child: SizedBox(
                            width: 128.0.w,
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
