import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../sizeconfig.dart';


class QRCodePage extends StatelessWidget {
  final String time;

  const QRCodePage({this.time});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Column(
        children: <Widget>[
          Container(height: SizeConfig.blockSizeVertical * 40,
            width: SizeConfig.blockSizeHorizontal * 100,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1.0)]),
            child: Center(
              child: QrImage(padding: EdgeInsets.all(20.0),
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 300,
                gapless: false,
              ),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            height: SizeConfig.blockSizeVertical * 16,
            width: SizeConfig.blockSizeHorizontal * 100,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1.0)]),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Valid For : ',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                    Text('24 Hours'),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Generated On : ',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                    Text('$time'),
                  ],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
