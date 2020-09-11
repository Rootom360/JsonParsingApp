import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Users.dart';

class Services{
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    try{
      final response = await http.get(Uri.encodeFull("https://jsonplaceholder.typicode.com/users"));
      if(200 == response.statusCode) {
        final List<User> users = usersFromJson(response.body);
            return users;
      }
      else if(404 == response.statusCode){
        Text('Bad request');
      }
      else {
        return List<User>();
      }
    }catch (e){
      return List<User>();
    }
  }
}
