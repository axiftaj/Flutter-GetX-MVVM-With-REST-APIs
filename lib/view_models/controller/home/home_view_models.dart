import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/hone_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.loading.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserListModel value) => userList.value = value;
  void setError(String value) => error.value = value;

  void userListApi() {
    //  setRxRequestStatus(Status.LOADING);

    _api.userListApi().then((value) {
      setRxRequestStatus(Status.completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.error);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.loading);

    _api.userListApi().then((value) {
      setRxRequestStatus(Status.completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.error);
    });
  }
}
