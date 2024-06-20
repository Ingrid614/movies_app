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
  Rx<List<Movie>> movies = Rx<List<Movie>>([]);

  Future getAllMovies () async{
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
