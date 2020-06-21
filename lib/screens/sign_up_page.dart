import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthrific/elements/auth_elements.dart';
import 'package:healthrific/services/auth.dart';
import 'package:healthrific/sizeconfig.dart';
import 'package:healthrific/screens/homepage.dart';

import '../elements/auth_elements.dart';
import 'homepage.dart';
import 'sign_in_page.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthService _auth = AuthService();
  String error = '';

  final _formKey = GlobalKey<FormState>();

  bool isAuthenticating = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockSizeVertical * 16,
              ),
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Form(
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
                            Icon(Icons.person),
                            SizedBox(
                              width: 14.0,
                            ),
                            Expanded(
                                child: TextFormField(
                                  validator: validateName,
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                      hintText: 'Full Name',
                                      border: InputBorder.none),
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
                            Icon(Icons.email),
                            SizedBox(
                              width: 14.0,
                            ),
                            Expanded(
                                child: TextFormField(
                                  validator: validateEmail,
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      hintText: 'Email Address',
                                      border: InputBorder.none),
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
                                child: TextFormField(
                                  validator: validatePassword,
                                  obscureText: true,
                                  controller: _passController,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      border: InputBorder.none),
                                )),
                            SizedBox(
                              width: 14.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 6),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SignInPage()));
                        },
                        child: Center(
                            child: Text(
                              'Already have an account? Sign In',
                              style:
                              TextStyle(color: Theme.of(context).primaryColor),
                            )),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      isAuthenticating
                          ? CircularProgressIndicator()
                          : Container(
                        padding: EdgeInsets.only(bottom: 10, top: 20),
                        width: SizeConfig.blockSizeHorizontal * 36,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                          child: Text('Sign Up'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result = await _auth.registerWithEmailAndPassword(
                                  _nameController.text,_emailController.text, _passController.text);
                              if(result != null) {
                              setState(() {
                                isAuthenticating = true;
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => HomePage()));
                              });

                              }
                              else{
                                error = 'Please check your entries';
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
      ),
    );
  }
}



