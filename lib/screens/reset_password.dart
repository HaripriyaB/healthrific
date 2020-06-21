import 'package:flutter/material.dart';
import 'package:healthrific/elements/auth_elements.dart';
import 'package:healthrific/sizeconfig.dart';


class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final _formKey2 = GlobalKey<FormState>();

  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Reset Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child:  Form(
                key: _formKey2,
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
                              child: TextFormField( validator:validateEmail,
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
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, top: 20),
                      width: SizeConfig.blockSizeHorizontal * 48,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: submitted ? Text('Email sent. Send Again!') : Text('Reset Password'),
                        onPressed: () {
                          if(_formKey2.currentState.validate()){
                            setState(() {
                              submitted = true;
                              print(submitted);
                            });
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