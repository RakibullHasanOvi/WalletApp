import 'package:flutter/material.dart';
import 'package:wallets_app/Pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 29, 14),
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 230),
                child: Image(
                  image: AssetImage(
                    'assets/Group 255.png',
                  ),
                  color: Colors.white,
                ),
                //     Text(
                //       'সঞ্চয় ওয়ালেট',
                //       style: TextStyle(
                //         fontSize: 30,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 40,
                        left: 25,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 237, 29, 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 28,
                      ),
                      child: Text(
                        'Lets get started',
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 100, 100),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        right: 28,
                        left: 28,
                      ),
                      child: Form(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(238, 230, 241, 244),
                            hintText: 'Mobile number',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        right: 28,
                        left: 28,
                      ),
                      child: Form(
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(238, 230, 241, 244),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 280),
                      child: Text('Forgot password ?'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 25,
                        right: 25,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(400, 60),
                          primary: Color.fromARGB(255, 237, 29, 14),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
