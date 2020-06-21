
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:healthrific/elements/covid_info_model.dart';


class Info{
  final String url = "https://disease.sh/v2/all";

  Future<GlobalInfo> getGlobalJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body);
      return GlobalInfo.fromJson(convertDataJson);
    } else {
      throw Exception('Something went wrong! Try again later');
    }
  }

  Future<CountryInfo> getCountryJsonData(country) async {
    var response = await http.get(
      Uri.encodeFull("https://disease.sh/v2/countries/$country?yesterday=false"),
    );
    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body);
      return CountryInfo.fromJson(convertDataJson);
    } else {
      throw Exception('Something went wrong! Try again later');
    }
  }


}


class CountryInfoWidget extends StatefulWidget {
  final String country;
  const CountryInfoWidget({this.country});
  @override
  _CountryInfoWidgetState createState() => _CountryInfoWidgetState();
}

class _CountryInfoWidgetState extends State<CountryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Info().getCountryJsonData(widget.country),
      builder: (context, snapshot) {

        if(snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(widget.country),
                Text('${snapshot.data.cases}',textAlign: TextAlign.start,)
              ],
            ),
          );
        }else
          return CircularProgressIndicator();
      },
    );
  }
}


class GlobalInfoWidget extends StatelessWidget{
  final int snapshotData;
  final String title;
  const GlobalInfoWidget({@required this.snapshotData, @required this.title});
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text('$snapshotData'),
      ],
    );
  }
}