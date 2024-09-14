import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/filter_element.dart';

class Filters extends StatefulWidget {
  final String type;
  final List<PhoneEntites> phones;
  const Filters({
    super.key,
    this.type = 'samsung',
    required this.phones,
  });

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
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
              widget.phones.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(left: 4.0.w),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(kRadius24),
                    onTap: () {},
                    child: FilterElement(
                      text: widget.phones[index].type,
                      color: widget.type == widget.phones[index].type
                          ? AppColors.lightGreen
                          : AppColors.white,
                    ),
                  ),
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
