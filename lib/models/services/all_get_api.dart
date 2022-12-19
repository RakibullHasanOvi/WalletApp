import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

dynamic api;
final storage = FlutterSecureStorage();

Future<List<dynamic>> getmethod(String url) async {
  final showtoken = await storage.read(key: 'token');

  final responce = await http.get(
    Uri.parse(url),
    headers: {
      HttpHeaders.authorizationHeader: "token $showtoken",
      // 'token 89c685db5914bcd6aafc4437cd643e0bbaf218aa',
    },
  );
  api = jsonDecode(responce.body.toString());
  if (responce.statusCode == 200) {
  } else {
    return api;
  }
  return api;
}

String getDomain() => 'http://zune360.com';

/// get balance
Future<int> getBalance(String url) async {
  final showtoken = await storage.read(key: 'token');
  final responce = await http.get(
    Uri.parse(url),
    headers: {
      HttpHeaders.authorizationHeader: 'token $showtoken',
    },
  );
  int value = jsonDecode(responce.body.toString());
  if (responce.statusCode == 200) {
    // print('this is response $value');
    return value;
  } else {
    return 0;
  }
  // return value;
}
