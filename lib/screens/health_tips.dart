import 'package:flutter/material.dart';
import 'package:healthrific/models/health_cardview.dart';

import 'healthtipselectpage.dart';


class HealthTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Health Tips',style: TextStyle(color: Theme.of(context).primaryColor),),
        backgroundColor: Colors.white,),
      body : Center(child : CardList()),
      backgroundColor: Colors.white,
    );
  }
}

class CardList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ListWidget();
  }
}

class ListWidget extends State<CardList>{
  final List<Health_card> cardlist = [
    Health_card("Immunity Booster Kit",1, AssetImage('images/immunity.jpg')
        ,"https://www.healthline.com/nutrition/how-to-boost-immune-health#5.-Limit-added-sugars"),
    Health_card("Self Protection Guide",2,AssetImage('images/selfprotect.jpg'),
    "https://www.who.int/health-topics/coronavirus#tab=tab_2"),
    Health_card("Healthy Diet for Children and Senior Citizens",3, AssetImage('images/childrenandold.jpg'),
    "https://www.helpguide.org/articles/healthy-eating/healthy-food-for-kids.html"),
    Health_card("Emergency Tips",4, AssetImage('images/emergency.jpg'),
    "https://www.healthforteens.co.uk/health/in-an-emergency/7-most-common-medical-emergencies/")
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: cardlist.length,
          itemBuilder: (BuildContext context,int index) => buildCard(context, index)
      ),
    );
  }
  Widget buildCard(BuildContext context,int index){
    final card = cardlist[index];
    return Container(
      child: Card(
        color: Colors.purple,
        elevation: 10,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: <Widget>[
                        Image(
                          image : card.tipImage,
                          fit: BoxFit.contain,
                        ),
                        Text(
                            card.title,
                            textScaleFactor: 1.5,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => HealthTipsSelectPage(health_card:card)
                ));
          },
        ),
      ),
    );
  }
}
