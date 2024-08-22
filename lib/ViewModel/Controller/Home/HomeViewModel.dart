import 'package:get/get.dart';
import 'package:getx_mvvm/Data/Response/responseStatus.dart';
import 'package:getx_mvvm/Models/Home/Userlistmodel.dart';
import 'package:getx_mvvm/Repositories/HomeRepository/homeRepository.dart';

class HomeViewModel extends GetxController {
  final _api = Homerepository();

  final rxRequestStatus = Status.LOADING.obs;

  final userList = UserListModel().obs;

  final RxString error = ''.obs;

  void setError(String _value){
    error.value = _value;
  }

  void setRxRequesStatus(Status _value){
    rxRequestStatus.value = _value;
  }

  void setUserList(UserListModel _model){
    userList.value = _model;
  }

  void userListApi()async{

    _api.userListApi().then((value){
      setRxRequesStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error,StackTrace){
      setError(error.toString());
      print(error);
      print(StackTrace);
      setRxRequesStatus(Status.ERROR);
    });
  }
}
