import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: Icon(
          obscureText ? Icons.remove_red_eye : Icons.visibility_off,
          color: Color(0xffC9CECF),
        ),
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
