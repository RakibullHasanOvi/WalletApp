import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';

class LoginButton extends StatefulWidget {
  final String phoneNumber;
  final String password;
  const LoginButton({
    Key? key,
    required this.password,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final storage = FlutterSecureStorage();
  bool _isLoading = false;
//! this is login func
  Future<dynamic> login(number, password) async {
    Map<String, String> data = {
      "username": number,
      "password": password,
    };

    // var jsonData = 0;

    var response = await http.post(
      Uri.parse('http://zune360.com/api/user/login/'),
      body: data,
    );

// end of loding..

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var _token = jsonData['token'];
      //local stroge save the token..
      await storage.write(
        key: 'token',
        value: jsonData['token'],
      );

      setState(
        () {
          _isLoading = false;
          // print('Login Successfully $_token');
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const BottomNavigation(),
                transitionDuration: const Duration(seconds: 0),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
              (route) => false);
        },
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[100],
            content: Row(
              children: [
                const Icon(
                  Icons.warning_rounded,
                  color: Colors.red,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  child: const Text(
                    'Something went worng,Please check your number or password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width / 1, 50),
        primary: const Color(0xFFD6001B),
      ),
      onPressed: () {
        setState(() {
          _isLoading = true;
        });
        login(
          widget.phoneNumber.toString(),
          widget.password.toString(),
        );
      },
      child: _isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Please Wait..',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }
}
