import 'package:flutter/material.dart';
import 'package:getx_mvvm/Resources/Colors/appColors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.loading = false,
      required this.title,
      this.height = 50,
      this.width = 60,
      required this.onPressed,
      this.textColor = AppColors.primaryTextColor,
      this.buttonColor = AppColors.primaryButtonColor});

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPressed;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: loading
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.white,
                      ),
                ))),
    );
  }
}
