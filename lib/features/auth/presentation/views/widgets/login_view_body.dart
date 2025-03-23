import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_images.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            SizedBox(height: 33),
            DontHaveAnAccountWidget(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 16),
            SocialLoginButton(
              title: 'تسجيل بواسطة جوجل',
              image: Assets.imagesGoogleIcons,
              onPressed: () {},
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              title: 'تسجيل بواسطة أبل',
              image: Assets.imagesAppleIcons,
              onPressed: () {},
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              title: 'تسجيل بواسطة فيسبوك',
              image: Assets.imagesFacebookIcons,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
