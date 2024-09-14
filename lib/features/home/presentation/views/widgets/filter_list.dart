import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/features/home/data/static/phones_static_data.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/filter_element.dart';

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
