import 'dart:convert';

import 'package:carros/models/api_response.dart';
import 'package:carros/models/user.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String senha) async {
    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');

    final params = {'username': login, 'password': senha};
    final headers = {"Content-type": "application/json"};

    try {
      var response =
          await http.post(url, body: json.encode(params), headers: headers);

      final mapResponse = json.decode(response.body);
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        User user = userFromJson(response.body);
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse['error']);
    } catch (e, exception) {
      print('Erro no login $e > $exception');

      return ApiResponse.error('Não foi possivel fazer o login');
    }
  }
}
