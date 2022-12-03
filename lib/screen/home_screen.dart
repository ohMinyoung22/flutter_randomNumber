import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {
    setState(() {
      List<int> newList = [];

      int numCount = 0;
      while (numCount < 3) {
        int val = Random().nextInt(900) + 100;

        if (!newList.contains(val)) {
          newList.add(val);
          numCount++;
        }
      }

      randomNumbers = newList;
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤 숫자 생성기',
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return SettingsScreen();
                },
              ),
            );
          },
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({super.key, required this.randomNumbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              .entries
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                    bottom: e.key == 2 ? 0 : 16.0,
                  ),
                  child: Row(
                    children: e.value
                        .toString()
                        .split('')
                        .map(
                          (t) => Image.asset(
                            'assets/images/$t.png',
                            height: 50,
                            width: 30,
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback? onPressed;
  const _Footer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: RED_COLOR),
        onPressed: onPressed,
        child: Text(
          '생성하기',
        ),
      ),
    );
  }
}
