import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ludokin_agent/data/models/commande.dart';
import '../models/user.dart';
import '../providers/api_provider.dart';

class ApiRepository{
  final ApiProvider _apiProvider;
  ApiRepository(this._apiProvider);
  var responseBody = '';
  final box = GetStorage();
  Rx<List<Command>> commands = Rx<List<Command>>([]);



  Future login(Object data) async {
    responseBody = "";
    try {
      var response = await _apiProvider.login(data);
      var body = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body.toString());
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
        debugPrint(body.toString());
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
        debugPrint(body.toString());
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

  Future createCommand(Object data) async{
    responseBody = "";
    try {
      print('hello world');
      var response = await _apiProvider.createCommand(data);
      var body = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(body.toString());
        // return Command.fromJson(body['command']);
      } else {
        debugPrint(body.toString());
        responseBody = body['error'].toString();
        return Future.error('server_error');
      }
    } catch (e) {
      debugPrint('what\'s wrong?');
      print(e.toString());
    }
  }

  Future getAllCommands () async{
    responseBody = "";
    commands.value.clear();
    try{
      print('getting all commands');
      var response = await _apiProvider.getAllCommands();
      var body = json.decode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        debugPrint(body.toString());
        for(var item in body['data']){
          commands.value.add(Command.fromJson(item));
          print('bad connection');
        }
        print(commands.value);
        return commands;
      }else{
        debugPrint(body.toString());
        return Future.error('server_error');
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future getRecentsCommands () async{
    responseBody = "";
    commands.value.clear();
    try{
      var response = await _apiProvider.getAllCommands();
      var body = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201){
        debugPrint(body.toString());
        for(var item in body['data']){
          commands.value.add(Command.fromJson(item));
        }
        return commands;
      }else{
        debugPrint(body.toString());
        return Future.error('server_error');
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future newPassword(Object data) async{
    try{
      var response = await _apiProvider.newPassword(data);
      var body = json.decode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201){
        debugPrint(body.toString());
      }else{
        debugPrint(body.toString());
        return Future.error('server_error');
      }
    }catch(e){
      print(e.toString());
    }
  }
}