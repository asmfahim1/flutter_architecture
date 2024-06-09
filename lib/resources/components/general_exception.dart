import 'package:flutter/material.dart';
import 'package:flutter_architecture/resources/colors/app_color.dart';
import 'package:get/get.dart';

class GeneralExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: size.height * .15,
          ),

          const Icon(
            Icons.cloud_off_outlined,
            color: AppColor.redColor,
            size: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text('general_exception'.tr, textAlign: TextAlign.center,),
          ),

          SizedBox(
            height: size.height * .15,
          ),

          InkWell(
            onTap: onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Center(
                child: Text('retry'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.whiteColor), ),
              ),

            ),
          ),

        ],
      ),
    );
  }
}
