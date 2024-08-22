import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/Routes/RoutesNames.dart';
import 'package:getx_mvvm/ViewModel/Controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();
  void isLogin() {
    userPreferences.getUser().then(
      (value) {
        if (kDebugMode) {
          print(value.token.toString());
        }
        if (value.token!.isEmpty || value.token.toString() == 'null') {
          Timer(
              Duration(seconds: 2), () => Get.toNamed(RoutesNames.loginScreen));
        } else{
          Timer(
              Duration(seconds: 2), () => Get.toNamed(RoutesNames.homeScreen));
        }
      },
    );
  }
}
