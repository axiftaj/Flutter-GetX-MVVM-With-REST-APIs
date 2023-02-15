
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';

import 'package:getx_mvvm/utils/utils.dart';

import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';
import '../res/components/round_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Text('email_hint'.tr),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
