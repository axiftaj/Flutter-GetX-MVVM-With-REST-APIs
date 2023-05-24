import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';
import 'package:getx_mvvm/res/getx_loclization/languages.dart';
import 'package:getx_mvvm/res/routes/routes.dart';

import 'res/getx_loclization/lang_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LocaleController locale = Get.put(LocaleController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final langs = locale.getSavedLocale();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: langs,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
