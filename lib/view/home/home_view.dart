

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeVM = Get.put(HomeViewModel());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeVM.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value){
              Get.toNamed(RouteName.loginView);
            });
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        print(homeVM.userList.toString());
        switch(homeVM.rxRequestStatus.value){
          case  Status.LOADING:
            return CircularProgressIndicator();
          case Status.ERROR:
            return Text('error');
          case Status.COMPLETED:
            return Text('asiftaj');
        }
        return SizedBox();

      }),
    );
  }
}
