import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthrific',
      theme: ThemeData(
        primaryColor:Color(0xff44337b),
        accentColor:Color(0xffebeafd),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Healthrific'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isSignedIn;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSignedIn = prefs.getBool('SignedIn');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
          if (snapshot.hasData){
            FirebaseUser user = snapshot.data; // this is your user instance
            return HomePage();
          }
          /// other way there is no user logged.
          return SignUpPage();
        }
    );
  }
}
