import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const AppIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height30 * 1.2,
      width: Dimensions.height30 * 1.2,
      decoration: BoxDecoration(
        color: AppColors.lightgreyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(Dimensions.height15),
      ),
      child: Center(
          child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: Dimensions.isconSize24,
          color: Colors.white,
        ),
      )),
    );
  }
}
