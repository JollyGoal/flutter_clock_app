import 'package:flutter/material.dart';
import 'package:flutter_clock_app/config/palette.dart';
import 'package:flutter_clock_app/widgets/widgets.dart';

class Alarms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Clock(),
        ),
        const SizedBox(height: 48.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ALARM TIME',
                  style: const TextStyle(
                    color: Palette.primaryRed,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "06:12 PM",
                  style: const TextStyle(
                    color: Palette.secondaryBlue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WAKE UP IN',
                  style: const TextStyle(
                    color: Palette.primaryRed,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "1h 27m",
                  style: const TextStyle(
                    color: Palette.secondaryBlue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
