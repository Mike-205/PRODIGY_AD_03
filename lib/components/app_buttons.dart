import 'package:flutter/cupertino.dart';

import '../color/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AppButton({
    super.key,
    required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
          color: text == 'Start'? AppColors.buttonColor1 : (text == 'Stop'? AppColors.buttonColor3 : (text == 'Resume'? AppColors.displayColor : AppColors.buttonColor2)),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.buttonTextColor1,
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
