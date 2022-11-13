
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/constants.dart';
import '../resources/dimension.dart';

class CustomLayout extends StatefulWidget{
  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  Formations formation= Formations.FOUR_FOUR_TWO;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          FootballPitchBackgroundView(),
          //Formation442View(),
          //Formation4231View(),
          //Formation433View(),
          //Formation343View(),
          FormationView(formation: this.formation),
        ],
      ),
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.refresh),
      backgroundColor: Colors.blue,
        onPressed: (){
        setState(() {
          formation=Formations.values[Random().nextInt(Formations.values.length)];
        });
        },

    )
    );
  }
}

class FormationView extends StatelessWidget{
  final Formations formation;
  FormationView ({required this.formation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateFormation(formation),
    );
  }
  Widget _generateFormation(Formations formation) {
    switch (formation){
      case Formations.FOUR_FOUR_TWO:
        return Formation442View();
      case Formations.FOUR_TWO_THREE_ONE:
        return Formation4231View();
      case Formations.FOUR_THREE_THREE:
        return Formation433View();
      case Formations.THREE_FOUR_THREE:
        return Formation343View();
    }
  }
}

class Formation442View extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
              crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children:
            List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /15),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /15),
          PlayerView(
            isGoalKeeper: true,
          ),
          // SizedBox(height: MediaQuery.of(context).size.height /5),
        ],
      ),
    );
  }
}

class Formation4231View extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          PlayerView(
            isGoalKeeper: false,
          ),
          SizedBox(height: MediaQuery.of(context).size.height /25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /40),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /50),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /50),
          PlayerView(
            isGoalKeeper: true,
          ),
          // SizedBox(height: MediaQuery.of(context).size.height /5),
        ],
      ),
    );
  }
}

class Formation433View extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /15),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /15),
          PlayerView(
            isGoalKeeper: true,
          ),
          // SizedBox(height: MediaQuery.of(context).size.height /5),
        ],
      ),
    );
  }
}

class Formation343View extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /15),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children:
            List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height /15),
          PlayerView(
            isGoalKeeper: true,
          ),
          // SizedBox(height: MediaQuery.of(context).size.height /5),
        ],
      ),
    );
  }
}

class FootballPitchBackgroundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(FOOTBALLNET,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      ),
    );
  }
}

class PlayerView extends StatelessWidget{
  final bool isGoalKeeper;

  PlayerView({this.isGoalKeeper=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: MARGIN_XLARGE,
          height: MARGIN_XLARGE,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              MARGIN_MEDIUM_2,
            ),
            color: (isGoalKeeper) ? Colors.yellow : Colors.blue,
          ),
        ),
      ),
    );
  }


}

