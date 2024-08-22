import 'package:getx_mvvm/Data/Network/networkApiServices.dart';
import 'package:getx_mvvm/Models/Home/Userlistmodel.dart';
import 'package:getx_mvvm/Resources/AppUrl/appUrl.dart';

class Homerepository {
  final _apiservices = NetworkApiServices();

  Future<UserListModel> userListApi()async { 
    final response = await _apiservices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}