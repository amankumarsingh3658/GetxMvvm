// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_mvvm/Resources/Colors/appColors.dart';

class InternetExceptionWidget extends StatefulWidget {
    VoidCallback onPressed;
   InternetExceptionWidget({super.key, required this.onPressed});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final height = mq.height;
    final width = mq.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox( 
            height: height * 0.2,
          ),
          Icon(Icons.cloud_off, color: AppColors.red),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'internet_exception'.tr,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )),
          SizedBox(
            height: height * 0.15,
          ),
          InkWell(
            onTap: widget.onPressed,
            child: Container(
              height: height * 0.06,
              width: width * 0.5 ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primaryColor),
              child: Center(
                  child: Text(
                "Retry",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
