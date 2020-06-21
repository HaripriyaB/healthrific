import 'package:flutter/material.dart';
import 'package:healthrific/services/auth.dart';

import 'covid_info.dart';
import 'health_tips.dart';
import 'kiosk_test.dart';
import 'self_test.dart';
import 'sign_up_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.white,),
            label: Text('logout',style: TextStyle(color: Colors.white),),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                      builder: (context) => SignUpPage()));
            }),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HealthTipsPage(),
          CovidInfoPage(),
          SelfTestPage(),
          KioskTestPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(elevation: 2.0,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
          currentIndex: _currentIndex,
          items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.assistant,color: Theme.of(context).primaryColor,),
          backgroundColor: Theme.of(context).accentColor,
          title: Text('Tips',style: TextStyle(color: Theme.of(context).primaryColor),),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.info,color: Theme.of(context).primaryColor),
            backgroundColor: Theme.of(context).accentColor,
            title: Text('Info',style: TextStyle(color: Theme.of(context).primaryColor),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.note,color: Theme.of(context).primaryColor),
            backgroundColor: Theme.of(context).accentColor,
            title: Text('Self Test',style: TextStyle(color: Theme.of(context).primaryColor),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.scanner,color: Theme.of(context).primaryColor),
            backgroundColor: Theme.of(context).accentColor,
            title: Text('Kiosk Test',style: TextStyle(color: Theme.of(context).primaryColor),)
        ),
      ]),

    );
  }
}
