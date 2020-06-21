import 'package:healthrific/services/covid_info_api.dart';
import 'package:flutter/material.dart';
import 'package:healthrific/sizeconfig.dart';

class CovidInfoPage extends StatefulWidget {
  @override
  _CovidInfoPageState createState() => _CovidInfoPageState();
}

class _CovidInfoPageState extends State<CovidInfoPage> {

  bool _isLoading = false;
  final Info globalInfoRef = Info();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Covid-19 Info',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: globalInfoRef.getGlobalJsonData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: SizeConfig.blockSizeVertical * 25,
                      width: SizeConfig.blockSizeHorizontal * 100,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 1.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GlobalInfoWidget(snapshotData: snapshot.data.cases, title: 'Total Cases'),
                              GlobalInfoWidget(snapshotData: snapshot.data.recovered, title: 'Recovered'),
                              GlobalInfoWidget(snapshotData: snapshot.data.deaths, title: 'Deaths'),

                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GlobalInfoWidget(snapshotData: snapshot.data.active, title: 'Active'),
                              GlobalInfoWidget(snapshotData: snapshot.data.critical, title: 'Critical'),
                              GlobalInfoWidget(snapshotData: snapshot.data.affectedCountries, title: 'Countries'),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else
                    return CircularProgressIndicator();
                },
              ),
              Container(
//                height: SizeConfig.blockSizeVertical * 35,
//                width: SizeConfig.blockSizeHorizontal * 100,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 1.0)
                    ]),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Country',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Total Cases',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    CountryInfoWidget(
                      country: 'USA',
                    ),
                    CountryInfoWidget(
                      country: 'Brazil',
                    ),
                    CountryInfoWidget(
                      country: 'Russia',
                    ),
                    CountryInfoWidget(
                      country: 'India',
                    ),
                    CountryInfoWidget(
                      country: 'UK   ',
                    ),
                    CountryInfoWidget(
                      country: 'Spain',
                    ),
                    CountryInfoWidget(
                      country: 'Peru',
                    ),
                    CountryInfoWidget(
                      country: 'Italy',
                    ),
                    CountryInfoWidget(
                      country: 'Chile',
                    ),
                    CountryInfoWidget(
                      country: 'Iran',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
