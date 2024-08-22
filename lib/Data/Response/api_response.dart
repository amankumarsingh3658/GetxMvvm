import 'package:getx_mvvm/Data/Response/responseStatus.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading()
      : status = Status.LOADING; //Instance of ApiResponse with Status = loading
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.Error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
