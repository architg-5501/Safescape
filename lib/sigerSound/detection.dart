import 'package:flutter/material.dart';
import 'package:safescape/Dashboard/Home.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:audioplayers/audioplayers.dart';

class LiveFeed extends StatefulWidget {
  const LiveFeed({Key key}) : super(key: key);

  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  bool alertState = false;
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    // _checkOpening();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (alertState) {
                player.stop();
                setState(() {
                  alertState = false;
                  Navigator.pop(context);
                });
              } else {
                player.play(AssetSource('emergency.mp3'));
                setState(() {
                  alertState = true;
                });
              }
            },
            child: AvatarGlow(
              glowColor: Colors.redAccent[700],
              endRadius: 90.0,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: Material(
                // Replace this child with your own
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent[100],
                  child: Image.asset(
                    'assets/siren.png',
                    height: 60,
                  ),
                  radius: 40.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 0),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFD8080),
                      Color(0xFFFB8580),
                      Color(0xFFFBD079),
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.8,
                // color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.arrow_left,
                      size: 15,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "Danger Siren",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
