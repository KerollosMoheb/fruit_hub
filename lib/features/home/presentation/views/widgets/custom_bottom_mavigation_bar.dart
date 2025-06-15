import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomMavigationBar extends StatefulWidget {
  const CustomBottomMavigationBar({super.key});

  @override
  State<CustomBottomMavigationBar> createState() =>
      _CustomBottomMavigationBarState();
}

class _CustomBottomMavigationBarState extends State<CustomBottomMavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children:
            bottomNavigationBarItems.asMap().entries.map((e) {
              var index = e.key;
              var entity = e.value;

              return Expanded(
                flex: index == selectedIndex ? 3 : 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: NavigationBarItem(
                    isSelected: selectedIndex == index,
                    bottomNavigationBarEntity: entity,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
