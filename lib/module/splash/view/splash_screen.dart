import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/app_exceptions.dart';
import 'package:flutter_architecture/module/splash/services/splash_services.dart';
import 'package:flutter_architecture/resources/assets/image_assets.dart';
import 'package:flutter_architecture/resources/components/general_exception.dart';
import 'package:flutter_architecture/resources/components/global_round_button.dart';
import 'package:flutter_architecture/resources/components/internet_exception_widget.dart';
import 'package:flutter_architecture/utils/dialogue_utils/utils.dart';
import 'package:get/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('splash'.tr),
      ),
      body: Center(
        child: Text(
          'splash'.tr,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw InternetExceptions();
        },
      ),
    );
  }
}
