import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/data/static/phones_static_data.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/filter_element.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/selected_phones.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => ImagePickerCubit(),
        child: Column(
          children: [
            //AppBar
            HomeAppbar(),
            SizedBox(height: 8.0.h),
            //Filter
            BlocBuilder<ImagePickerCubit, int>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 4.0.w,
                        runSpacing: 4.0.h,
                        children: List.generate(
                          phonesLogos.length,
                          (index) {
                            return FilterElement(
                              image: phonesLogos[index],
                              index: index,
                            );
                          },
                        ),
                      ),
                      //Selected Phones
                      SelectedPhones(
                        desiredType: phonesNames[state],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
