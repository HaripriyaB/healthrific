import 'package:flutter/material.dart';

class SelfTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Self Assessment test',style: TextStyle(color: Theme.of(context).primaryColor),),
        backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
    );
  }
}
