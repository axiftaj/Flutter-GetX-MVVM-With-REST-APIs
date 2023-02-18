

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  UserPreference userPreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value){
              Get.toNamed(RouteName.loginView);
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
