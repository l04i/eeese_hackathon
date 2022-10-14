import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../utils/style.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key, required this.onTap, required this.color, required this.text})
      : super(key: key);
  final VoidCallback onTap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: MyTextStyle().mediumText(
                color != Colors.white ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
