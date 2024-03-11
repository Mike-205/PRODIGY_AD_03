import 'package:flutter/cupertino.dart';
import 'package:prodigy_ad_03/provider/my_timer.dart';
import 'package:provider/provider.dart';

import '../color/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;

  const AppButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final stopwatchProvider = Provider.of<StopWatchProvider>(context);
    Function() onTapFunction;
    Color backgroundColor;

    switch (text) {
      case 'Start':
        backgroundColor = AppColors.buttonColor1;
        onTapFunction =stopwatchProvider.start;
        break;

      case 'Stop':
        backgroundColor = AppColors.buttonColor3;
        onTapFunction = stopwatchProvider.stop;
        break;

      case 'Resume':
        backgroundColor = AppColors.displayColor;
        onTapFunction = stopwatchProvider.resume;
        break;

      case 'Reset':
        backgroundColor = AppColors.buttonColor2;
        onTapFunction = stopwatchProvider.reset;
        break;

      case 'Lap':
        backgroundColor = AppColors.buttonColor2;
        onTapFunction = stopwatchProvider.lap;
        break;

      default:
        backgroundColor = AppColors.buttonColor2;
        onTapFunction = (){};
        break;
    }

    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: 130,
        height: 50,
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
