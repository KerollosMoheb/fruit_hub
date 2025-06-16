import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_images.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: NotificationWidget(),
      leading: Image.asset(Assets.imagesProfile),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(color: Color(0xff949d9e)),
      ),
      subtitle: Text('أحمد مصطفي', style: TextStyles.bold16),
    );
  }
}
