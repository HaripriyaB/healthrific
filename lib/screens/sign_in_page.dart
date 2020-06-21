import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthrific/elements/auth_elements.dart';
import 'package:healthrific/screens/reset_password.dart';
import 'package:healthrific/sizeconfig.dart';
import 'package:healthrific/screens/homepage.dart';
import 'package:healthrific/services/auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  bool isAuthenticating = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            Padding(
              padding: EdgeInsets.all(10.0),
              child:  Form(
                key: _formKey,
                autovalidate: false,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 14.0,
                          ),
                          Icon(Icons.email),
                          SizedBox(
                            width: 14.0,
                          ),
                          Expanded(
                              child: TextFormField( validator: validateEmail,
                                controller: _emailController,
                                decoration: InputDecoration(
                                    hintText: 'Email Address', border: InputBorder.none),
                              )),
                          SizedBox(
                            width: 14.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 3),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 14.0,
                          ),
                          Icon(Icons.lock),
                          SizedBox(
                            width: 14.0,
                          ),
                          Expanded(
                              child: TextFormField( validator: validatePassword,
                                obscureText: true,
                                controller: _passController,
                                decoration: InputDecoration(
                                    hintText: 'Password', border: InputBorder.none),
                              )),
                          SizedBox(
                            width: 14.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 3),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ResetPasswordPage()));
                      },
                      child: Center(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          )),
                    ),
                    isAuthenticating ? CircularProgressIndicator() : Container(
                      padding: EdgeInsets.only(bottom: 10, top: 20),
                      width: SizeConfig.blockSizeHorizontal * 36,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: Text('Sign In'),
                        onPressed: () async {
                          if(_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(
                                _emailController.text, _passController.text);
                            if (result != null) {
                              setState(() {
                                isAuthenticating = true;
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              });
                            }
                          }
                        },
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
