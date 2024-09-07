import 'package:flutter/material.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/data/static/phones_static_data.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/phone_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: phones
                .map((phone) => PhoneItem(
                      phone: phone,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
