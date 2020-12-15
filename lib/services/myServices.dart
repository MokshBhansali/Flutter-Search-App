import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:searnall/models/Usermodels.dart';

class Services {
  static const String url = "https://jsonplaceholder.typicode.com/users";
  static Future<List<UserViewModel>> getUsers() async {
    final responce = await http.get(url);
    List<UserViewModel> list = parseUsers(responce.body);
    return list;
    // try {
    //   final responce = await http.get(url);
    //   if (responce.statusCode == 200) {
    //     List<UserViewModel> list = parseUsers(responce.body);
    //     return list;
    //   } else {
    //     throw Exception("Error");
    //   }
    // } catch (e) {
    //   print(e);
    //   throw Exception(e.toString());
    // }
  }

  static List<UserViewModel> parseUsers(String responceBody) {
    final parsed = json.decode(responceBody).cast<Map<String, dynamic>>();
    return parsed
        .map<UserViewModel>((json) => UserViewModel.fromJson(json))
        .toList();
  }
}
