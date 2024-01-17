import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myfirstapplication/Screens/Signup/components/pass_sign.dart';
import 'package:myfirstapplication/otp.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:http/http.dart' as http;


class SignUpForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  SignUpForm({
    Key? key,
  }) : super(key: key);
  Future<void> _signup() async {
    final String email = emailController.text;
    try {

      final response = await http.post(
        Uri.parse('http://10.11.6.4:8000/getotp'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          'email':email
        }),
      );

      if (response.statusCode == 200) {
        print('Signup successful: ${response.body}');
      } else {
        print('Signup failed: ${response.body}');
      }
    } catch (e) {
      if (e is http.ClientException) {
        // Handle network-related errors
        print('Network error during signup: $e');
      } else {
        // Handle other exceptions
        print('Error during signup: $e');
      }
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
            onSaved: (email) {
            },
            decoration: const InputDecoration(
              hintText: "Your email",

              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            controller: emailController,
          ),

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Otp(value:emailController.text)),

              );
              _signup();
              //var route = new MaterialPageRoute(builder: (BuildContext context)=>new pass(value: emailController.text));
            },
            child: Text("Send Otp".toUpperCase()),
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