import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/filter_list.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/selected_phones.dart';

class HomeViewBody extends StatelessWidget {
  final List<PhoneEntites> phones;
  const HomeViewBody({
    super.key,
    required this.phones,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //AppBar
          const HomeAppbar(),
          //Banner
          //حط الاعلان هنا يعم ابراهيم
          SizedBox(height: 16.0.h),
          //Filter elements
          Filters(), //لسة دا هيتظبط
          SizedBox(height: 16.0.h),
          //Selected phones
          Wrap(
            spacing: 16.0.w,
            children: [
              ...List.generate(
                phones.length,
                (index) {
                  final phone = phones[index];
                  return SelectedPhones(
                    phones: phone,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
