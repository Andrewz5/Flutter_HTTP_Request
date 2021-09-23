// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter_http_requests/Model/User.dart';

class UserServices {
  String baseURL = "https://jsonplaceholder.typicode.com";
  String userLink = "/users";
  List<User> userList = [];
  Future<List<User>> getUser() async {
    Response response = await Dio().get('$baseURL$userLink');
    var data = response.data;
    data.forEach((element) {
      userList.add(User.fromJson(element));
    });
    return userList;
  }
}
