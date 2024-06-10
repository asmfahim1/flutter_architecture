import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/response/status.dart';
import 'package:flutter_architecture/module/home/controller/home_controller.dart';
import 'package:flutter_architecture/resources/colors/app_color.dart';
import 'package:flutter_architecture/resources/components/internet_exception_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getUserList();
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: SpinKitCircle(
                color: AppColor.primaryColor,
              ),
            );
          case Status.ERROR:
            if(controller.error.toString() == 'No internet'){
              return InternetExceptionWidget(onPress: (){
                controller.getUserList();
              });
            }else{
              return Center(
                child: Text(
                  controller.error.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            }
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: controller.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage('${controller.userList.value.data![index].avatar}'),),
                      title: Text(
                          '${controller.userList.value.data![index].firstName}'),
                      subtitle: Text('${controller.userList.value.data![index].email}'),
                    ),
                  );
                });
        }
        return const SizedBox();
      }),
    );
  }
}
