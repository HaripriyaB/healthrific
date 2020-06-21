import 'package:flutter/material.dart';
import 'package:healthrific/screens/selftest.dart';

class SelfTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Self Assessment test',style: TextStyle(color: Theme.of(context).primaryColor),),
        backgroundColor: Colors.white,),
      body: Center(
        child: Container(
            child: FlatButton(
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SelfTest()));
              },
              color: Colors.white,
              child: Text("Take Self Assessment Test",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold
                ),),
            )
        ),
      ),
    );
  }
}

