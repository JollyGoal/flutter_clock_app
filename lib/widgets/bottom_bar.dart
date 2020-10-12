import 'package:flutter/material.dart';
import 'package:flutter_clock_app/config/palette.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () => print('EDIT ALARMS'),
            child: Text(
              "EDIT ALARMS",
              style: const TextStyle(
                letterSpacing: 1.5,
              ),
            ),
            color: const Color(0xffff5e92),
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 25.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          FloatingActionButton(
            onPressed: () => print('add'),
            child: Text(
              "+",
              style: const TextStyle(
                color: Palette.secondaryBlue,
                fontWeight: FontWeight.w700,
                fontSize: 25.0,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 5.0,
            foregroundColor: Colors.black,
            highlightElevation: 3,
          ),
        ],
      ),
    );
  }
}
