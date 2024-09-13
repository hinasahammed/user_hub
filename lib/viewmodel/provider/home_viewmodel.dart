import 'package:flutter/material.dart';
import 'package:user_hub/data/reponse/status.dart';
import 'package:user_hub/model/user_model/user_model.dart';
import 'package:user_hub/repository/home_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final repo = HomeRepository();
  List<UserModel> userList = [];

  int _currenteight = 50;
  int get currenteight => _currenteight;

  Status _status = Status.loading;
  Status get status => _status;

  void changeHeight(int height) {
    _currenteight = height;
    notifyListeners();
  }

  void changeStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  Future<List<UserModel>> fetchUser() async {
    changeStatus(Status.loading);
    final response = await repo.fetchUser();
    for (var i in response) {
      userList.add(UserModel.fromJson(i));
    }

    changeStatus(Status.completed);
    return userList;
  }
}
