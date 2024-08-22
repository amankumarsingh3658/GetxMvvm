import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Models/Login/userModel.dart';
import 'package:getx_mvvm/Repositories/LoginRpository/loginRepository.dart';
import 'package:getx_mvvm/Resources/Routes/RoutesNames.dart';
import 'package:getx_mvvm/Utilities/utils.dart';
import 'package:getx_mvvm/ViewModel/Controller/user_preferences/user_preferences_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  final UserPreferences userPreferences = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      if (value['error'] == 'user not found') {
        Utils.snackBar('Error', value['error']);
      } else {
        userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
          Get.delete<LoginViewModel>();

          Get.toNamed(RoutesNames.homeScreen);
        }).onError((error, StackTrace) {
          Utils.snackBar('Error', 'Unable To go to HomeScreen');
        });
        Utils.snackBar('Login', 'Succesfull');
      }
      loading.value = false;
    }).onError((error, StackTrace) {
      Utils.snackBar('Error', error.toString());
      loading.value = false;
    });
  }
}
