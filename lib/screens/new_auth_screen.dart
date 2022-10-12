// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/http_exception.dart';
import '../providers/auth.dart';

enum AuthMode { Signup, Login }

class NewAuthScreen extends StatelessWidget {
  const NewAuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.black,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child:
                AuthCard()) /*Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ImageandText(),
              SizedBox(height: 17),
              InputCard('Email', 'Message.png'),
              InputCard('Password', 'Lock.png'),
              SizedBox(height: 14),
              switchAndTexts(),
              SizedBox(height: 25),
              ButtonAndText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LogInWithSocials('google 1.png'),
                  LogInWithSocials('apple 1.png'),
                  LogInWithSocials('facebook-app-symbol 1.png'),
                ],
              ),
              SizedBox(height: 15),
              BottomText()
            ],
          ),
        )*/
        );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Okay'),
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    print('object');
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false)
            .logIn(_authData['email'], _authData['password']);
      } else {
        await Provider.of<Auth>(context, listen: false).signUp(
          _authData['email'],
          _authData['password'],
        );
      }
    } on HttpException catch (error) {
      var errorMassage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMassage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMassage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMassage = 'Password is weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMassage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMassage = 'Invalid password';
      }
      _showErrorDialog(errorMassage);
    } catch (error) {
      const errorMassage = 'Could not authenticate you';
      _showErrorDialog(errorMassage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          ImageandText(
            authMode: _authMode,
          ),
          SizedBox(height: 17),
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  InputCard(
                    hintText: 'Email',
                    iconPath: 'Message.png',
                    obscureText: false,
                    tag: 'email',
                    authData: _authData,
                  ),
                  InputCard(
                    hintText: 'Password',
                    iconPath: 'Lock.png',
                    obscureText: true,
                    tag: 'password',
                    authData: _authData,
                    controller: _passwordController,
                  ),
                  _authMode == AuthMode.Login
                      ? switchAndTexts()
                      : InputCard(
                          hintText: 'Confirm Password',
                          iconPath: 'Lock.png',
                          obscureText: true,
                        ),
                ],
              )),

          /*
          */

          SizedBox(height: 25),
          ButtonAndText(
            authMode: _authMode,
            submit: _submit,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LogInWithSocials('google 1.png'),
              LogInWithSocials('apple 1.png'),
              LogInWithSocials('facebook-app-symbol 1.png'),
            ],
          ),
          SizedBox(height: 15),
          BottomText(
            switchAuth: _switchAuthMode,
          ),
        ],
      ),
    );
  }
}

class ButtonAndText extends StatelessWidget {
  final Function submit;
  final AuthMode _authMode;
  const ButtonAndText({
    Key key,
    @required AuthMode authMode,
    this.submit,
  })  : _authMode = authMode,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          textColor: Colors.white,
          onPressed: submit,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 17, horizontal: 80),
            child: Text(
              '${_authMode == AuthMode.Login ? 'LOGIN' : 'SIGNUP'}',
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
        SizedBox(height: 10),
      ],
    );
  }
}

class BottomText extends StatelessWidget {
  final Function switchAuth;
  const BottomText({
    Key key,
    this.switchAuth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don’t have an account? ',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          TextSpan(
              text: 'Register now',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()..onTap = switchAuth),
        ],
      ),
    );
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
        SizedBox(height: 56)
      ],
    );
  }
}

class InputCard extends StatelessWidget {
  final hintText;
  final String iconPath;
  final bool obscureText;
  final String tag;
  final TextEditingController controller;
  final Map<String, String> authData;
  InputCard({
    @required this.hintText,
    @required this.iconPath,
    @required this.obscureText,
    this.tag,
    this.authData,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color(0xff262626),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: (value) {
              if (tag == 'password') {
                if (value.isEmpty || value.length < 5) {
                  return 'Password is too short!';
                }
                return 'AAAAAAAAAAA';
              } else if (tag == 'email') {
                if (value.isEmpty || !value.contains('@')) {
                  return 'Invalid email!';
                }
              }
              return 'BBBBBBBB';
            },
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
            onSaved: (value) {
              authData[tag] = value;
            },
          ),
        ),
      ),
    );
  }
}

class ImageandText extends StatelessWidget {
  final AuthMode _authMode;

  const ImageandText({
    Key key,
    @required AuthMode authMode,
  })  : _authMode = authMode,
        super(key: key);

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
          '${_authMode == AuthMode.Login ? 'LOGIN' : 'SIGNUP'}',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 23),
        ),
      ],
    );
  }
}
