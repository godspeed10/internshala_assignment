import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_assign/play_arena_list.dart';
// import 'package:splash_assign/models/list.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double blueHeight = 0;
  double orangeHeight = 0;
  double purpleHeight = 0;
  double redHeight = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        blueHeight = 300;
      });
    })
        .whenComplete(() => Future.delayed(Duration(milliseconds: 200), () {
              setState(() {
                orangeHeight = 220;
              });
            }))
        .whenComplete(() => Future.delayed(Duration(milliseconds: 200), () {
              setState(() {
                purpleHeight = 300;
              });
            }))
        .whenComplete(() => Future.delayed(Duration(milliseconds: 200), () {
              setState(() {
                redHeight = 250;
              });
            }))
        .whenComplete(() => Future.delayed(
            Duration(milliseconds: 500),
            () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PlayArenaList()),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment(-0.85, 0.15),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              height: blueHeight,
              width: blueHeight,
              child: Image.asset(
                'assets/images/blue-500x500.png',
                height: blueHeight,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, -0.15),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              height: orangeHeight,
              width: orangeHeight,
              child: Image.asset(
                'assets/images/orange-500x500.png',
                height: 220,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.85, 0.2),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              height: purpleHeight,
              width: purpleHeight,
              child: Image.asset(
                'assets/images/purple-500x500.png',
                height: 300,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.85, -0.15),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              height: redHeight,
              width: redHeight,
              child: Image.asset(
                'assets/images/red-500x500.png',
                height: 250,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/White-Logo-With-Text-500x500.png',
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
