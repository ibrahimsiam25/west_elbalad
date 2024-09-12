import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the Bloc package
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';

// Create a Cubit for managing the selected index
class ImagePickerCubit extends Cubit<int> {
  ImagePickerCubit() : super(0); // Initialize with the default index (0)

  void selectIndex(int index) {
    emit(index); // Update the selected index
  }
}

class FilterElement extends StatelessWidget {
  final String image;
  final int index;

  FilterElement({
    Key? key,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerCubit, int>(
      // Use BlocBuilder to listen to changes in the selected index
      builder: (context, selectedIndex) {
        return InkWell(
          borderRadius: BorderRadius.circular(kRadius24),
          onTap: () {
            context
                .read<ImagePickerCubit>()
                .selectIndex(index); // Update the selected index
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                width: 1,
                color: selectedIndex == index
                    ? AppColors.lightGreen
                    : AppColors.white,
              ),
              borderRadius: BorderRadius.circular(kRadius24),
            ),
            child: Image.asset(
              image,
              height: 40.0.h,
              width: 80.0.w,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
