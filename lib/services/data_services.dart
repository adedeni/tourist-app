import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:travelapp/model/data_model.dart";

class DataServices {
  String baseUrl = 'https://api.npoint.io';
 Future<List<DataModel>> getInfo () async {
    var apiUrl = '/d47e3bd0e205149ea208';

    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));

    try {
      if(res.statusCode==200) {
        List<dynamic> list = json.decode(res.body);
        //print(list);
        debugPrint(list.toString(), wrapWidth: 1024);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return<DataModel> [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return<DataModel> [];
    }

  } 
}