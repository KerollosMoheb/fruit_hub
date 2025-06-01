import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_progress_hud.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/home_view.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }
}
