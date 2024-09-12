// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:user_hub/data/reponse/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed() : status = Status.completed;
  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return "Status:$status\nmessage:$message\ndata:$data";
  }
}
