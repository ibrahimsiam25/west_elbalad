import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';
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
      child: Column(
        children: [
          //AppBar
          HomeAppbar(), //Banner
          //حط الاعلان هنا يعم ابراهيم
          //لسة دا هيتظبط
          SizedBox(height: 16.0.h),
          //Filters
          Filters(
            type: selectedType,
            phones: phones,
          ),
          SizedBox(height: 16.0.h),
          //Selected phones
          Wrap(
            spacing: 16.0.w,
            children: [
              ...phones
                  .where(
                (phone) => phone.type == selectedType,
              )
                  .map((phone) {
                return SelectedPhones(phones: phone);
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
