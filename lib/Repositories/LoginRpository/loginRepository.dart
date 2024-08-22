import 'package:getx_mvvm/Data/Network/networkApiServices.dart';
import 'package:getx_mvvm/Resources/AppUrl/appUrl.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(
    var data,
  ) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.loginUrl);
    return response;
  }
}
