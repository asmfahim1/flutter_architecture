import 'package:flutter/material.dart';
import 'package:flutter_architecture/resources/colors/app_color.dart';

class GlobalRoundButton extends StatelessWidget {
  final String title;
  final double height, width;
  final Color btnColor, textColor;
  final VoidCallback onPressed;

  const GlobalRoundButton({
    super.key,
    required this.title,
    this.height = 40,
    this.width = 160,
    required this.onPressed,
    this.btnColor = AppColor.primaryBtnColor,
    this.textColor = AppColor.primaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.whiteColor),
                ),
              ),
      ),
    );
  }
}
