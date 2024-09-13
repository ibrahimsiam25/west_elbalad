import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            const HomeAppbar(),
            //Banner
            //حط الاعلان هنا يعم ابراهيم
            SizedBox(height: 16.0.h),
            //Filter
            BlocBuilder<ImagePickerCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    //Filter elements
                    Filters(),
                    //Selected Phones
                    SelectedPhones(
                      desiredType: phonesNames[state],
                    ),
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

class Filters extends StatelessWidget {
  const Filters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0.h,
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 16.0.w),
            ...List.generate(
              phonesLogos.length,
              (index) {
                return FilterElement(
                  image: phonesLogos[index],
                  index: index,
                );
              },
            ),
            SizedBox(width: 8.0.w),
          ],
        ),
      ),
    );
  }
}
