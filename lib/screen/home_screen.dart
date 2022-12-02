import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '랜덤 숫자 생성기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  ),
                ],
              ),
              Expanded(
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
                                      height: 70,
                                      width: 50,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: RED_COLOR),
                  onPressed: () {
                    setState(() {
                      for (int i = 0; i < 3; i++) {
                        int val = 0;
                        val += Random().nextInt(900) + 100;
                        randomNumbers[i] = val;
                      }
                    });
                  },
                  child: Text(
                    '생성하기',
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
