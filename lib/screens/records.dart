import 'package:flutter/material.dart';
import 'package:flutter_clock_app/config/palette.dart';

class Records extends StatelessWidget {
  const Records({Key key}) : super(key: key);

  final double _smallFontSize = 12.0;
  final double _valFontSize = 30.0;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final double _smallFontSpacing = 1.3;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AVERAGE SLEEP",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: Palette.fontColorPrimary,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '6.45h',
                    style: TextStyle(
                      fontWeight: _valFontWeight,
                      fontSize: _valFontSize,
                      color: Palette.fontColorPrimary,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    "LAST RECORDED",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: Palette.fontColorPrimary,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '7.50h',
                    style: TextStyle(
                      fontWeight: _valFontWeight,
                      fontSize: _valFontSize,
                      color: Palette.fontColorPrimary,
                    ),
                  ),
                ],
              ),
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Color(0xfff0f5fb),
                  border: Border.all(
                    width: 8.0,
                    color: Color(0xffd3e1ed),
                  ),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "THIS WEEK",
                      style: TextStyle(
                        fontSize: _smallFontSize,
                        fontWeight: _smallFontWeight,
                        letterSpacing: _smallFontSpacing,
                        color: Palette.fontColorPrimary,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      height: 120.0,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: double.infinity,
                      child: CustomPaint(
                        foregroundPainter: GraphPainter(percents: [
                          0.8,
                          0.35,
                          0.9,
                          0.4,
                          0.2,
                          0.7,
                          0.5,
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 25.0),
          _RecordItem(
            dayTitle: 'SUNDAY',
            date: '04/10/2020',
            minutes: 45,
          ),
          _RecordItem(
            dayTitle: 'MONDAY',
            date: '05/10/2020',
            minutes: 90,
          ),
          _RecordItem(
            dayTitle: 'TUESDAY',
            date: '06/10/2020',
            minutes: 20,
          ),
          _RecordItem(
            dayTitle: 'WEDNESDAY',
            date: '07/10/2020',
            minutes: 77,
          ),
          _RecordItem(
            dayTitle: 'THURSDAY',
            date: '08/10/2020',
            minutes: 95,
          ),
          _RecordItem(
            dayTitle: 'FRIDAY',
            date: '09/10/2020',
            minutes: 64,
          ),
          _RecordItem(
            dayTitle: 'SATURDAY',
            date: '10/10/2020',
            minutes: 30,
          ),
          _RecordItem(
            dayTitle: 'SUNDAY',
            date: '11/10/2020',
            minutes: 15,
          ),
        ],
      ),
    );
  }
}

class _RecordItem extends StatelessWidget {
  final String dayTitle;
  final String date;
  final int minutes;

  const _RecordItem({
    Key key,
    @required this.dayTitle,
    @required this.date,
    @required this.minutes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffdde9f7),
            width: 1.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayTitle,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Palette.fontColorPrimary,
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.3,
                  color: Palette.fontColorPrimary,
                ),
              ),
              const SizedBox(width: 25.0),
              Expanded(
                child: Text(
                  durationToString(minutes),
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.3,
                    color: Palette.fontColorPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return minutes > 60
        ? '${parts[0]}h ${parts[1].padLeft(2, '0')}m'
        : '${parts[1].padLeft(2, '0')}m';
  }
}

class GraphPainter extends CustomPainter {
  Paint trackBarPaint = Paint()
    ..color = Color(0xff818aab)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  Paint trackPaint = Paint()
    ..color = Color(0xffdee6f1)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  final List<double> percents;

  GraphPainter({@required this.percents});

  @override
  void paint(Canvas canvas, Size size) {
    Path trackPath = Path();
    Path trackBarPath = Path();

    for (int i = 0; i < percents.length; i++) {
      trackPath.moveTo(size.width * 0.16 * i, size.height);
      trackPath.lineTo(size.width * 0.16 * i, 0);

      trackBarPath.moveTo(size.width * 0.16 * i, size.height);
      trackBarPath.lineTo(
          size.width * 0.16 * i, size.height * (1 - percents[i]));
    }

    canvas.drawPath(trackPath, trackPaint);
    canvas.drawPath(trackBarPath, trackBarPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
