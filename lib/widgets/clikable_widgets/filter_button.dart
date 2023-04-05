import 'package:flutter/material.dart';
import '../../helpers/const.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key,
      required this.isSelected,
      required this.onClick,
      required this.btnTitle});
  final bool isSelected;
  final Function onClick;
  final String btnTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? mainColor : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: mainColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Center(
              child: Text(
                btnTitle,
                style: TextStyle(
                    color: isSelected ? Colors.white : mainColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
