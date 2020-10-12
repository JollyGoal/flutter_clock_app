import 'package:flutter/material.dart';
import 'package:flutter_clock_app/config/palette.dart';
import 'package:flutter_clock_app/screens/screens.dart';
import 'package:flutter_clock_app/widgets/clock/clock.dart';
import 'package:flutter_clock_app/widgets/clock/clock_text.dart';
import 'package:flutter_clock_app/widgets/widgets.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loading(),
    );
  }
}

class AppClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: BottomBar(),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(31),
              child: Container(
                color: Colors.transparent,
                child: SafeArea(
                  child: Column(
                    children: [
                      TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Palette.primaryRed,
                            width: 4.0,
                          ),
                          insets: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0),
                        ),
                        indicatorWeight: 15.0,
                        labelColor: Palette.secondaryBlue,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelColor: Colors.black26,
                        tabs: [
                          Tab(
                            text: "ALARMS",
                            icon: Icon(
                              Icons.watch_later,
                              size: 40.0,
                            ),
                          ),
                          Tab(
                            text: "RECORDS",
                            icon: Icon(
                              Icons.menu,
                              size: 40.0,
                            ),
                          ),
                          // Tab(
                          //   text: "PROFILE",
                          //   icon: Icon(
                          //     Icons.supervised_user_circle,
                          //     size: 40.0,
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Alarms(key: PageStorageKey('alarmsScreen')),
              ),
              Records(key: PageStorageKey('recordsScreen')),
              // Profile(),
            ],
          ),
        ),
      ),
    );
  }
}
