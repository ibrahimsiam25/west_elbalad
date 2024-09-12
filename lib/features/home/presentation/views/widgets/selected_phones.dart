import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/features/home/data/static/phones_static_data.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/phone_item.dart';

class SelectedPhones extends StatelessWidget {
  final String desiredType;
  const SelectedPhones({
    super.key,
    this.desiredType = 'samsung',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Column(
        children: [
          SizedBox(height: 16.0.h),
          Wrap(
            spacing: 16.0,
            children: phones
                .where((phone) => phone.type == desiredType)
                .map(
                  (phone) => PhoneItem(
                    phone: phone,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
