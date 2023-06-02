

import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class SplashServices {

  UserPreference userPreference = UserPreference();

  void isLogin(){


    userPreference.getUser().then((value){

      log(value.token.toString());
      log(value.isLogin.toString());

      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RouteName.loginView) );
      }else {
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RouteName.homeView) );
      }
    });


  }
}