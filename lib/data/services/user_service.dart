import 'dart:convert';

import '../../config/value.dart';
import '../endpoint/endpoint.dart';
import '../models/list_user.dart';
import 'package:http/http.dart' as http;

class UserDataService {
  Future<List<DataUser>> getData() async {
    final response = await http.get(Uri.parse(Endpoints.userUrl));
    if (response.statusCode != 200) {
      String errorMessage = jsonDecode(response.body)["error"];
      throw "$httpException $errorMessage";
    }

    var listUser = ListUser.fromJson(json.decode(response.body));

    return listUser.dataUser ?? [];
  }
}
