import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: Color(0xffebf9f1)),
      child: Center(
        child: Text(
          "لديك 3 منتجات في سلةالتسوق",
          style: TextStyle(
            color: Color(0xff1b5e37),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ),
    );
  }
}
