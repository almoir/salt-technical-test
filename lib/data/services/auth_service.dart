import 'dart:convert';

import '../../config/value.dart';
import '../endpoint/endpoint.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> doLogin(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(Endpoints.loginUrl),
        body: {"email": email, "password": password},
      );

      if (response.statusCode != 200) {
        String errorMessage = jsonDecode(response.body)["error"];
        throw "$httpException $errorMessage";
      }
    } catch (e) {
      rethrow;
    }
  }
}
