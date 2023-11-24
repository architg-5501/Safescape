import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class Safepath extends StatelessWidget {
  const Safepath({Key key}) : super(key: key);
  // final Uri _url = Uri.parse('https://rohitsaini29.github.io/maps/');

  // void launchUrl() async {
  //   if (await canLaunchUrl(_url)) {
  //     await canLaunchUrl(_url);
  //   } else {
  //     throw 'can launch $_url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pink[100],
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 150,
                child: Image.asset(
                  'assets/safetrip.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "HOW DO YOU FEEL?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 5, left: 5, top: 5, bottom: 8),
                        child: Text(
                          "It looks like you're ready for a getaway!",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: Text('Get Safely Started'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 177, 112, 188),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () => {
                          openMap(),
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

Future<void> openMap() async {
  // String googleUrl = 'https://maps-swart.vercel.app/';
  String googleUrl = 'https://safescape-journey.vercel.app/';

  try {
    await launch(googleUrl);
  } catch (e) {
    print(e);
    Fluttertoast.showToast(
        msg: "Something went wrong! Call emergency numbers.");
  }
  // if (await canLaunch(googleUrl)) {
  //   await launch(googleUrl);
  // } else {
  //   throw 'Could not open the map.';
  // }
}
