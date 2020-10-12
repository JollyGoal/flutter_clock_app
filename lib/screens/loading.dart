import 'package:flutter/material.dart';
import 'package:flutter_clock_app/main.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, _createRoute());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              color: Colors.white,
              child: Lottie.asset(
                'assets/lottie/loader-spinning-circle.json',
                frameRate: FrameRate(70),
                onLoaded: (composition) async {
                  await Future.delayed(composition.duration);
                  try {
                    Navigator.pushReplacement(context, _createRoute());
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AppClock(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
