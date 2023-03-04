import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/services/api.dart';

class UserService {
  static Future<Map?> getMe() async {
    final http.Response response = await CallApi().getData('/getMe');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['data'] as Map;
      return result;
    } else {
      return null;
    }
  }
}
