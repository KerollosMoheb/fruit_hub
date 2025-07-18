import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_images.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:fruits_e_commerce_app/core/widgets/password_feild.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),
              SizedBox(height: 33),
              DontHaveAnAccountWidget(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              SocialLoginButton(
                title: 'تسجيل بواسطة جوجل',
                image: Assets.imagesGoogleIcons,
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              SizedBox(height: 16),
              Platform.isIOS
                  ? SocialLoginButton(
                    title: 'تسجيل بواسطة أبل',
                    image: Assets.imagesAppleIcons,
                    onPressed: () {},
                  )
                  : const SizedBox(),
              // SizedBox(height: 16),
              SocialLoginButton(
                title: 'تسجيل بواسطة فيسبوك',
                image: Assets.imagesFacebookIcons,
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
