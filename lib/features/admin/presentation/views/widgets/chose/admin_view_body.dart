import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_styles.dart';
import 'package:west_elbalad/features/admin/presentation/views/widgets/chose/custom_admin_view_card.dart';


class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Spacer(flex: 1),
        Center(child: Text('الصفحة الرئيسية للمشرف', style: AppStyles.header)),
        Spacer(flex: 1),
        CustomAdminViewCard(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kusersInformatinsView);
          },
          title: "عرض المستخدمين",
        ),
        Spacer(flex: 2),
                CustomAdminViewCard(
          onPressed: () {},
          title: " عرض الطلبات ",
        ),
        Spacer(flex: 2),
                CustomAdminViewCard(
          onPressed: () {},
          title: "التعديل في المتجر ",
        ),
        Spacer(flex: 4),
      ],
    ));
  }
}

