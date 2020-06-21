


class GlobalInfo {
  var cases;
  var deaths;
  var recovered;
  var active;
  var critical;
  var affectedCountries;

  GlobalInfo({this.cases,this.deaths,this.recovered,this.active,this.critical,this.affectedCountries});


  factory GlobalInfo.fromJson(final json)
  {
    return GlobalInfo(
      cases:json["cases"],
      deaths : json["deaths"],
      recovered : json["recovered"],
      active : json["active"],
      critical: json['critical'],
      affectedCountries: json['affectedCountries']
    );
  }
}

class CountryInfo {
  var cases;
  var deaths;
  var recovered;
  var active;
  var critical;


  CountryInfo({this.cases,this.deaths,this.recovered,this.active,this.critical,});


  factory CountryInfo.fromJson(final json)
  {
    return CountryInfo(
        cases:json["cases"],
        deaths : json["deaths"],
        recovered : json["recovered"],
        active : json["active"],
        critical: json['critical'],

    );
  }
}
