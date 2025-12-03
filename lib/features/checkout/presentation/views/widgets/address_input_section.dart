import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'الاسم بالكامل',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'البريد الالكتروني',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'العنوان',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'المدينه',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقة',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
