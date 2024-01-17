import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myfirstapplication/otp.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:http/http.dart' as http;
class pass extends StatefulWidget {
  final String value;

  const pass({Key? key, required this.value}) : super(key: key);

  @override
  _passwordState createState() => _passwordState();
}

class _passwordState extends State<pass> {
  String emailController = '';
  final TextEditingController passwordController = TextEditingController();
  void init(){
    emailController = widget.value;
  }

  Future<void> _signup() async {
    final String email = emailController;
    final String password = passwordController.text;
    print("Hello");
    try {
      final response = await http.post(
        Uri.parse('http://10.11.6.25:8000/signup'), // Replace with your server URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Signup successful, handle the response as needed
        print('Signup successful: ${response.body}');
      } else {
        // Signup failed, handle the error
        print('Signup failed: ${response.body}');
      }
    } catch (e) {
      // Exception occurred during signup, handle the error
      print('Error during signup: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child : TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "conform Password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
      ),

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              print(emailController);

            },
            child: Text("Sign UP".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}