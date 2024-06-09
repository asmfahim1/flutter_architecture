import 'package:flutter_architecture/data/response/status.dart';



//Generic class for handle response
class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);


  ApiResponse.Loading() : status = Status.LOADING ;
  ApiResponse.completed(this.data) : status = Status.COMPLETED ;
  ApiResponse.error(this.message) : status = Status.ERROR ;

  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data: $data";
  }

}