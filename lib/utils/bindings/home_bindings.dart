import 'package:flutter_architecture/module/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}