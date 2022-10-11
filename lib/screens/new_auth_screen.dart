// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

enum AuthMode { Signup, Login }

class NewAuthScreen extends StatelessWidget {
  const NewAuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            children: [
              ImageandText(),
              SizedBox(height: 17),
              InputCard('Email', 'Message.png'),
              InputCard('Password', 'Lock.png'),
              SizedBox(height: 14),
              switchAndTexts(),
              SizedBox(height: 25),
              Column(
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    textColor: Colors.white,
                    onPressed: (() {}),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 80),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    color: Color(0xff262626),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Log in with',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LogInWithSocials('google 1.png'),
                      LogInWithSocials('apple 1.png'),
                      LogInWithSocials('facebook-app-symbol 1.png'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Don’t have an account? Register now',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class LogInWithSocials extends StatelessWidget {
  final String path;

  LogInWithSocials(this.path);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 65,
        width: 65,
        child: Card(
          color: Color(0xff262626),
          child: Image.asset('assets/images/$path'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ));
  }
}

class switchAndTexts extends StatefulWidget {
  bool asd = false;

  @override
  State<switchAndTexts> createState() => _switchAndTextsState();
}

class _switchAndTextsState extends State<switchAndTexts> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CupertinoSwitch(
          thumbColor: Color(0xff262626),
          value: widget.asd,
          onChanged: (_) {
            setState(() {
              widget.asd = !widget.asd;
            });
          },
          activeColor: Colors.white,
        ),
        SizedBox(width: 7),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Remember Me',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InputCard extends StatelessWidget {
  final hintText;
  final String iconPath;

  InputCard(this.hintText, this.iconPath);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color(0xff262626),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/images/$iconPath',
                color: Color(0xffFFFFFF),
              ),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: hintText,
            ),
            style: TextStyle(
              color: Color(0xffFFFFFF).withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageandText extends StatelessWidget {
  const ImageandText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            child: Image.asset(
              'assets/images/Saly-19.png',
              width: 275,
              height: 275,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(height: 17),
        Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 23),
        ),
      ],
    );
  }
}
