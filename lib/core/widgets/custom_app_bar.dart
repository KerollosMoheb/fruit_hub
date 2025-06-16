import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/notification_widget.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
  );
}
