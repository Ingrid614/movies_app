import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user.dart';
import '../providers/api_provider.dart';

class ApiRepository{
  final ApiProvider _apiProvider;
  ApiRepository(this._apiProvider);
  var responseBody = '';
  final box = GetStorage();


  Future login(Object data) async {
    responseBody = "";
    try {
      var response = await _apiProvider.login(data);
      var body = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
        box.write('id', body['id']);
        return User.fromJson(body['data']);
      } else {
        debugPrint(response.body);
        responseBody = body['error'].toString();
        return Future.error('server_error');
      }
    } catch(e){
      print(e.toString());
    }
  }

  Future registerUser(User user) async {
    responseBody = "";
    try {
      var response = await _apiProvider.register(user);

      var body = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(body);
        box.write('id', body['id']);
        return User.fromJson(body['data']);

        // } else if (response.statusCode == 422) {
        //   throw ValidationException(body['errors'][0]['msg']);
      } else {
        debugPrint(response.body);
        responseBody = body['error'].toString();
        return Future.error('server_error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateUser(Object data) async{
    responseBody = "";
    try {
      var response = await _apiProvider.updateUser(data);

      var body = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(body);
        return User.fromJson(body['data']);

      } else {
        debugPrint(response.body);
        responseBody = body['error'].toString();
        return Future.error('server_error');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}