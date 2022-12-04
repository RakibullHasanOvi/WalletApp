import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

dynamic api;
Future<List<dynamic>> getmethod(String url) async {
  final responce = await http.get(
    Uri.parse(url),
    headers: {
      HttpHeaders.authorizationHeader:
          'token f41105f69a37bf2fbf7a2fe343f56513def7daaa',
    },
  );
  api = jsonDecode(responce.body.toString());
  if (responce.statusCode == 200) {
  } else {}
  return api;
}
