import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:showcaseview/showcaseview.dart';

import '../constants/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final key1 = GlobalKey();

  BuildContext? cxt;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        ShowCaseWidget.of(cxt!).startShowCase([key1]);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          cxt = context;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              title: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  Icon(
                    CupertinoIcons.settings,
                    color: AppColor.primaryColor,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Showcase(
                  key: key1,
                  title: 'Set your settings for more',
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
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5,
                        children: [
                          Icon(
                            CupertinoIcons.settings,
                            color: AppColor.primaryColor,
                            size: 30,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
