import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';

import '../../../repository/home/home_repository.dart';

class HomeViewModel extends GetxController {

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  void setRxRequestStatus(Status _value)=> rxRequestStatus.value = _value;

  final userList = UserListModel().obs;
  void setUserList(UserListModel _value) =>  userList.value = _value;


  void userListApi(){
    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
    });
  }
}