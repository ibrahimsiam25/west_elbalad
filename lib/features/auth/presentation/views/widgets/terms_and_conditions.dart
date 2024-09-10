import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/constants/app_colors.dart';
import 'package:west_elbalad/features/auth/presentation/views/widgets/custom_check_box.dart';



class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppStyles.semiBold16.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.red,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppStyles.semiBold16,
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.red,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppStyles.semiBold16,
                ),
                TextSpan(
                  text: 'بنا',
                  style: AppStyles.semiBold16
                      .copyWith(color: AppColors.red),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
