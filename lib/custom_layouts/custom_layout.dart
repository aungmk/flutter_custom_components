
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/dimension.dart';

class CustomLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        FootballPitchBackgroundView(),
        FormationView(),
      ],
    );
  }

}

class FormationView extends StatelessWidget{
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

