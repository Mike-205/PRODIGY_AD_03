import 'package:flutter/cupertino.dart';

import '../color/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double scaleFactor;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap, required this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {

    Color backgroundColor;
    switch (text) {
      case 'Start':
        backgroundColor = AppColors.buttonColor1;
        break;

      case 'Stop':
        backgroundColor = AppColors.buttonColor3;
        break;

      case 'Resume':
        backgroundColor = AppColors.displayColor;
        break;

      case 'Reset':
        backgroundColor = AppColors.buttonColor2;
        break;

      case 'Lap':
        backgroundColor = AppColors.buttonColor2;
        break;

      default:
        backgroundColor = AppColors.buttonColor2;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130*scaleFactor,
        height: 50*scaleFactor,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.buttonTextColor1,
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
