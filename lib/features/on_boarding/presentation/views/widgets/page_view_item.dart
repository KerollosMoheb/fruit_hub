import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/signin_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isVisable,
  });
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisable,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(kIsOnBoardinViewSeen, true);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(SigninView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "تخط",
                      style: TextStyles.regular13.copyWith(
                        color: Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(color: Color(0xFF4E5456)),
          ),
        ),
      ],
    );
  }
}
