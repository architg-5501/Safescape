import 'dart:math';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:blurry/blurry.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safescape/Dashboard/ContactScreens/phonebook_view.dart';
import 'package:safescape/Dashboard/DashWidgets/Scream.dart';
import 'package:safescape/Dashboard/DashWidgets/safePath.dart';
import 'package:safescape/Dashboard/Dashboard.dart';
import 'package:safescape/Dashboard/Settings/SettingsScreen.dart';
import 'package:safescape/Fake%20call/fake.dart';
import 'package:safescape/SelfDefence/ho.dart';
import 'package:safescape/SwipeButton.dart';
import 'package:safescape/Dashboard/Articles%20-%20SafeCarousel/AllArticles.dart';
import 'package:safescape/Dashboard/DashWidgets/BookCab.dart';
import 'package:safescape/Dashboard/DashWidgets/DashAppbar.dart';
import 'package:safescape/Dashboard/DashWidgets/Emergency.dart';
import 'package:safescape/Dashboard/DashWidgets/LiveSafe.dart';
import 'package:safescape/Dashboard/Articles%20-%20SafeCarousel/SafeCarousel.dart';
import 'package:safescape/Dashboard/DashWidgets/OtherFeature.dart';
import 'package:safescape/Dashboard/DashWidgets/SafeHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../sigerSound/detection.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var battery = Battery();
  var batteryPercentage = 0;
  var alertState = false;
  final player = AudioPlayer();
  int check = 1;
  int quoteIndex = 0;

  // String _alanSdkKey = '6e9af97f9e4cb20c7996be56c8ddc53a2e956eca572e1d8b807a3e2338fdd0dc/stage';
  @override
  void initState() {
    super.initState();
    // _checkOpening();

    alertState = false;
    getRandomInt(false);
  }

  _handleCommand(Map<String, dynamic> response) {
    switch (response["command"]) {
      case "fakenow":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Fake()));
        break;

      case "alert":
        // setState(() {divi
        // bgColor = Colors.yellow;
        // });

        break;
      case "report":
        _callNumber("7827170170");
        break;
      case "helpline":
        _callNumber("1091");
        break;
      case "police":
        _callNumber("100");
        break;
      case "spycam":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LiveFeed()));
        break;
      case "home":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Dashboard()));
        break;
      case "contact":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PhoneBook()));
        break;
      case "defence":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Ho()));
        break;
      case "setting":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
      case "pstation":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => openMap("Police Stations near me")));
        break;
      case "article":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AllArticles()));
        break;
      case "cab":
        _openrl(
            "https://play.google.com/store/apps/details?id=com.ubercab&gl=US");
        break;

      default:
        print("no match found");
        break;
    }
  }

  getRandomInt(fromClick) {
    Random rnd = Random();

    quoteIndex = rnd.nextInt(4);
    if (mounted && fromClick) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // if(check==1){
    //   Future.delayed(Duration.zero, () => showLocAlert(context));
    //   setState(() {
    //     check++;
    //   });
    // }
    // if(batteryPercentage<=15){
    //   showAlert(context);
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // DashAppbar(
        //   getRandomInt: getRandomInt,
        //   quoteIndex: quoteIndex,
        // ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Safepath(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Features",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              OtherFeature(),
              SizedBox(
                height: 12,
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 16.0, bottom: 10, top: 10),
              //   child: Text(
              //     "Book Cab",
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              //   ),
              // ),

              // const BookCab(),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10, top: 10),
                child: Text(
                  "Explore LiveSafe",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              LiveSafe(),
              SizedBox(
                height: 15,
              ),
              //SafePath Map routing
              SafeCarousel(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllArticles(),
                    ),
                  );
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text("See More", textAlign: TextAlign.end)),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10, top: 15),
                child: Text(
                  "Be Empowered With",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Scream(),
              SafeHome(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Emergency",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Emergency(),
              SwipeButtonDemo(
                pageRoute: "/fifth",
                buttonTitle: "Swipe to report incident",
              ),
              Image.asset(
                "assets/bk_women.png",
                height: MediaQuery.of(context).size.height / 7,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // void showLocAlert(BuildContext context) {
  //   Blurry(
  //       title: 'Arm - Hands Free',
  //       barrierColor: Colors.pink.shade200,
  //       // layoutType: LayoutType.center,
  //       description:
  //           'We have provided you a personalized coversational AI to automate your interactions and provide personalized experience',
  //       icon: Icons.adjust_rounded,
  //       popupHeight: MediaQuery.of(context).size.height / 3.1,
  //       confirmButtonText: 'OK',
  //       onConfirmButtonPressed: () {
  //         Navigator.pop(context);
  //       }).show(context);
  // }

  openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$location';

    try {
      await launch(googleUrl);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Something went wrong! Call emergency numbers.");
    }
  }

  _callNumber(number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  _openrl(String url) async {
    // List<Application> apps = await DeviceApps.getInstalledApplications();
    // DeviceApps.openApp("com.ubercab");
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }
}
