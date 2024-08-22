// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_mvvm/Resources/Colors/appColors.dart';

class GeneralExceptionWidget extends StatefulWidget {
  VoidCallback onPressed;
  GeneralExceptionWidget({super.key, required this.onPressed});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final height = mq.height;
    final width = mq.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Icon(
            Icons.cloud_off,
            color: AppColors.red,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('general_exception'.tr)),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          InkWell(
            onTap: widget.onPressed,
            child: Container(
              height: height * 0.06,
              width: width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primaryColor),
              child: Center(
                  child: Text("Retry",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.white,
                          ))),
            ),
          )
        ],
      ),
    );
  }
}
