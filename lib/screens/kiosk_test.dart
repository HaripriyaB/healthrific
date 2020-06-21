import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:intl/intl.dart';
import '../sizeconfig.dart';
import 'discovery_page.dart';
import 'qr_code.dart';

class KioskTestPage extends StatefulWidget {
  @override
  _KioskTestPageState createState() => _KioskTestPageState();
}

class _KioskTestPageState extends State<KioskTestPage> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  BluetoothDevice _bluetoothDevice;

  BluetoothConnection connection;

  String _address = "...";
  String _name = "...";
  String name;

  List<String> dataList = [];
  String arduinoData = 'connect a device to receive data';

  bool isConnected = false;

  Timer _discoverableTimeoutTimer;

  @override
  void initState() {
    super.initState();
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      if (await FlutterBluetoothSerial.instance.isEnabled) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    _discoverableTimeoutTimer?.cancel();
    super.dispose();
  }

  void getDataFromArduino() async {
    connection.input.listen((Uint8List data) {
      setState(() {
        arduinoData = '${ascii.decode(data)}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Kiosk Test',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: const Text('Enable Bluetooth'),
              value: _bluetoothState.isEnabled,
              onChanged: (bool value) {
                future() async {
                  if (value) {
                    await FlutterBluetoothSerial.instance
                        .requestEnable()
                        .then((value) {
                      setState(() {
                        value = true;
                        _bluetoothState = BluetoothState.STATE_ON;
                      });
                    });
                  } else {
                    await FlutterBluetoothSerial.instance
                        .requestDisable()
                        .then((value) {
                      setState(() {
                        _bluetoothState = BluetoothState.STATE_OFF;
                        value = false;
                      });
                    });
                  }
                }

                future().then((value) {
                  setState(() {});
                });
              },
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                'Select the device',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                final BluetoothDevice selectedDevice = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiscoveryPage()));
                setState(() {
                  _bluetoothDevice = selectedDevice;
                  name = selectedDevice.name;
                });
                print(selectedDevice.address);
                print(selectedDevice.name);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: <Widget>[
                _bluetoothDevice == null
                    ? Text('No device selected')
                    : Text(_bluetoothDevice.name),
                _bluetoothDevice == null
                    ? Text('select a device to continue')
                    : Text(_bluetoothDevice.address),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 1.0,
              color: Theme.of(context).primaryColor,
              child: isConnected
                  ? Text(
                      'Connected',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Connect',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: _bluetoothDevice == null
                  ? null
                  : () async {
                      await BluetoothConnection.toAddress(
                              _bluetoothDevice.address)
                          .then((value) {
                        connection = value;
                        setState(() {
                          isConnected = true;
                        });
                        connection.isConnected ? getDataFromArduino() : null;
                        setState(() {
                          dataList = arduinoData.split(',');
                        });
                      });
                    },
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.blockSizeHorizontal * 100,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1.0)]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  dataList.isEmpty
                      ? Text('Your test results will appear here')
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: dataList.length,
                          itemBuilder: (context, index) {
                            return Text(dataList[index]);
                          },
                        ),
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Show QR code',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 1.0,
              color: Theme.of(context).primaryColor,
              onPressed: !isConnected
                  ? null
                  : () {
                String time = DateFormat('dd-MM-yyyy').format(DateTime.now());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRCodePage(time: time)));
                    },
            ),
          ],
        ),
      ),
    );
  }
}
