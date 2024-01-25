import 'package:app_showcase/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:showcaseview/showcaseview.dart';

import '../components/cups_widget.dart';
import '../components/gauge_container.dart';
import '../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([key1, key2, key3]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Showcase.withWidget(
        key: key3,
        width: 50,
        height: 50,
        tooltipPosition: TooltipPosition.top,
        targetShapeBorder: const CircleBorder(),
        targetPadding: const EdgeInsets.all(10),
        container: CircleAvatar(
          backgroundColor: Colors.lightBlue,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/imgs/cup.png',
              width: 100,
            ),
          ),
        ),
        child: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          onPressed: () => null,
          child: const Icon(CupertinoIcons.drop_triangle_fill),
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => setState(() {
            ShowCaseWidget.of(context).startShowCase([key1, key2, key3]);
          }),
          child: const Icon(
            CupertinoIcons.info,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue,
        title: const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 5,
          children: [
            Icon(
              CupertinoIcons.drop_fill,
              color: AppColor.primaryColor,
            ),
            Text(
              'Water App',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            ),
            icon: Showcase(
              key: key1,
              description: 'Go to settings to find out more about our stuffs',
              targetShapeBorder: const CircleBorder(),
              tooltipBackgroundColor: Colors.lightBlue,
              textColor: Colors.white,
              showArrow: true,
              targetPadding: const EdgeInsets.all(8.0),
              descriptionPadding: const EdgeInsets.all(20.0),
              child: const Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Showcase(
            key: key2,
            title: 'Total Goal and water intake',
            titleTextStyle: const TextStyle(color: Colors.white),
            description: 'Track your goal and water intake',
            tooltipBackgroundColor: Colors.lightBlue,
            descTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            targetPadding: const EdgeInsets.all(8.0),
            descriptionPadding: const EdgeInsets.all(20.0),
            child: const SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GaugeContainer(),
                  SizedBox(height: 15),
                  Text(
                    'Monitor your gauge',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  CupsWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
