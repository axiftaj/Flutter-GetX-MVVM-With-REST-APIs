import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/home/home_view_models.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value){
              Get.toNamed(RouteName.loginView);
            });
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeController.error.value =='No internet'){
              return InterNetExceptionWidget(onPress: () {
                homeController.refreshApi();
              },);
            }else {
              return GeneralExceptionWidget(onPress: (){
                homeController.refreshApi();
              });
            }
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                      ),
                      title: Text(homeController.userList.value.data![index].firstName.toString()),
                      subtitle: Text(homeController.userList.value.data![index].email.toString()),

                    ),
                  );
                }
            );
        }
      }),
    );
  }
}
