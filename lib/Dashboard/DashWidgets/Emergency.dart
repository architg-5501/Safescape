import 'package:flutter/material.dart';
import 'package:safescape/Dashboard/DashWidgets/Emergencies/AmbulanceEmergency.dart';
import 'package:safescape/Dashboard/DashWidgets/Emergencies/MetroEmergency.dart';
import 'package:safescape/Dashboard/DashWidgets/Emergencies/FirebrigadeEmergency.dart';
import 'package:safescape/Dashboard/DashWidgets/Emergencies/PoliceEmergency.dart';
import 'package:safescape/Dashboard/DashWidgets/Emergencies/WomenDistress.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          WomenDistress(),
          PoliceEmergency(),
          MetroEmergency(),
          AmbulanceEmergency(),
          FireEmergency()
        ],
      ),
    );
  }
}
