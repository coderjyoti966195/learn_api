import 'dart:convert';

import 'package:http/http.dart' as http;

import 'image_model.dart';

class UsersSplashClass {
  Future<List<UsersModel>> getImage() async {
    var apiUrl = Uri.parse("https://api.unsplash.com/photos");
    var headers = {
      "Authorization": 'Client-ID s7uBbbImjCI20NFYH428Uqv-27TvoNNL_-LyNDvJpls'
    };
    var response = await http.get(apiUrl, headers: headers);
    if (response.statusCode == 200) {
      print("tow");
      var responseData = jsonDecode(response.body) as List;
      var data =
      responseData.map((json) => UsersModel.fromJson(json)).toList();
      return data;
    } else {
      return [];
    }
  }
}
