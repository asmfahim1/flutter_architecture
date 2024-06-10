import 'package:flutter/material.dart';
import 'package:flutter_architecture/resources/components/global_round_button.dart';
import 'package:flutter_architecture/utils/dialogue_utils/utils.dart';
import 'package:flutter_architecture/module/login/view_model_or_controller/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text('login'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginController.emailController.value,
                      focusNode: loginController.emailFocusNode.value,
                      decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessage('Please enter email');
                        }
                        return null;
                      },
                      onFieldSubmitted: (val) {
                        Utils.fieldFocusChange(
                            context,
                            loginController.emailFocusNode.value,
                            loginController.passwordFocusNode.value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: loginController.passwordController.value,
                      focusNode: loginController.passwordFocusNode.value,
                      decoration: InputDecoration(
                        hintText: 'password'.tr,
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GlobalRoundButton(
                title: 'login'.tr,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginController.loginMethod();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
