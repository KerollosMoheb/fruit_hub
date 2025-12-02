import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          isSelsected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '40',
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        SizedBox(height: 16),
        ShippingItem(
          isSelsected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقة الدفع',
          price: '0',
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
      ],
    );
  }
}
