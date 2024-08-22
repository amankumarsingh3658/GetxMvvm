import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_mvvm/Resources/Components/roundButton.dart';
import 'package:getx_mvvm/Utilities/utils.dart';
import 'package:getx_mvvm/ViewModel/Controller/Login/loginViewModel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final height = mq.height;
    final width = mq.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController.value,
                focusNode: loginController.emailFocusNode.value,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'email_hint'.tr),
                validator: (value) {
                  if (value!.isEmpty) {
                    return Utils.snackBar('Email Error', 'Enter Email');
                  }
                },
                onFieldSubmitted: (value) {
                  Utils.FieldFocusChange(
                      context,
                      loginController.emailFocusNode.value,
                      loginController.passwordFocusNode.value);
                },
              ),
              SizedBox(
                height: height * 0.01,
              ),
              TextFormField(
                controller: loginController.passwordController.value,
                focusNode: loginController.passwordFocusNode.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar('Password Error', 'Enter Password');
                  }
                },
                onFieldSubmitted: (value) {},
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'password_hint'.tr),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Obx(() {
                return RoundButton(
                  title: 'login'.tr,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginController.loginApi();
                    }
                  },
                  height: height * 0.06,
                  width: width * 0.5,
                  loading: loginController.loading.value,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
