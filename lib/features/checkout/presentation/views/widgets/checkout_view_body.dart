import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:fruits_e_commerce_app/core/utils/app_keys.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/check_out_steps_page_view.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            onTap: (index) {
              if (currentPageIndex == 0) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else if (index == 1) {
                var orderEntity = context.read<OrderEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  showBar(context, 'يرجي اختيار طريقة الدفع');
                }
              } else {
                _handleAddressValidation(context);
              }
            },
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handleAddressValidation(context);
              } else {
                _processPayment(context);
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      showBar(context, 'يرجي اختيار طريقة الدفع');
    }
  }

  void _handleAddressValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    var addOrderCubit = context.read<AddOrderCubit>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: kPayPalClientId,
              secretKey: kPayPalSecretKey,
              transactions: [paypalPaymentEntity.toJson()],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                Navigator.pop(context);
                showBar(context, 'تمت عملية الدفع بنجاح');
                addOrderCubit.addOrder(order: orderEntity);
              },
              onError: (error) {
                Navigator.pop(context);
                log(error.toString());
                showBar(context, 'حدث خطأ في عملية الدفع');
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
      ),
    );
  }
}

String getNextButtonText(int currentPageIndex) {
  switch (currentPageIndex) {
    case 0:
      return 'التالي';
    case 1:
      return 'التالي';
    case 2:
      return 'الدفع عبر PayPal';
    default:
      return 'التالي';
  }
}
