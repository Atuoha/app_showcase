import 'package:app_showcase/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: const Icon(CupertinoIcons.drop_triangle_fill),
      ),
      appBar: AppBar(
        leading: const Icon(
          CupertinoIcons.info,
          color: Colors.white,
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
            icon: const Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'Your gauge',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Monitor your gauge',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: List.generate(
                  8,
                  (index) => Image.asset(
                    'assets/imgs/cup.png',
                    width: 50,
                    color: index % 2 == 0
                        ? AppColor.primaryColor
                        : Colors.grey.withOpacity(0.6),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
