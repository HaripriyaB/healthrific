import 'package:flutter/material.dart';


class KioskTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Kiosk Test',style: TextStyle(color: Theme.of(context).primaryColor),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
    );
  }
}
