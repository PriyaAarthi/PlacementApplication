import 'package:flutter/material.dart';
import 'package:myfirstapplication/Screens/Signup/components/pass_sign.dart';
import 'package:myfirstapplication/Screens/Signup/components/sign_up_top_image.dart';
import 'package:myfirstapplication/Screens/Signup/components/signup_form.dart';
import 'package:myfirstapplication/constants.dart';
import 'package:myfirstapplication/responsive.dart';
import '../../../components/background.dart';
class password extends StatefulWidget {
  final String value;

  const password({Key? key, required this.value}) : super(key: key);

  @override
  _passwordState createState() => _passwordState();
}


class _passwordState extends State<password> {
  String h = '';
  void init(){
    h = widget.value;
  }
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileSignupScreen(value :h,),
          desktop: Row(
            children: [
              Expanded(
                child: SignUpScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: pass(value: h),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  final String value;

  const MobileSignupScreen({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: pass(value: value,),
            ),
            Spacer(),
          ],
        ),
        // SocalSignUp()
      ],
    );
  }
}


