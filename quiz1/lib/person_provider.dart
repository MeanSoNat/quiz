import 'dart:convert';

import 'package:http/http.dart';
import 'package:quiz1/person_list_model.dart';
import 'package:quiz1/personlistmodel.dart';

class PersonProvider {
  Future<PersonList> getPersonList() async {
    var uri = Uri.http("swapi.dev", 'api/people/');
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PersonList pmodel = PersonList.fromJson(body);
      return pmodel;
    } else {
      print("Can't get response from server");
      throw "Server exception";
    }
  }

  Future<Personmodel> persondata(String url) async {
    var LastKey = Uri.parse(url);
    var uri = Uri.https("swapi.dev", LastKey.path);
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      Personmodel permodel = Personmodel.fromJson(body);
      return permodel;
    } else {
      print("Can't get response from server");
      throw "Server exception";
    }
  }
}
