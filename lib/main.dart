import 'package:flutter/material.dart';
import 'package:flutter_architecture/resources/getx_localization/languages.dart';
import 'package:flutter_architecture/resources/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'APP NAME',
      // home: SplashScreen(),
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
