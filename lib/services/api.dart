import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = "https://todo.paydali.uz/api";

  postData(body, apiUrl) async {
    String token = await getToken();
    final fullUrl = _url + apiUrl;
    return await http
        .post(Uri.parse(fullUrl), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  getData(apiUrl) async {
    String token = await getToken();
    final fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  patchData(body, apiUrl) async {
    String token = await getToken();
    final fullUrl = _url + apiUrl;
    return await http
        .patch(Uri.parse(fullUrl), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  deleteData(apiUrl) async {
    String token = await getToken();
    final fullUrl = _url + apiUrl;
    return await http.delete(Uri.parse(fullUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  putData(body, apiUrl) async {
    String token = await getToken();
    final fullUrl = _url + apiUrl;
    final response =
        await http.put(Uri.parse(fullUrl), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response;
  }
}

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  return token.toString() ?? '';
}
