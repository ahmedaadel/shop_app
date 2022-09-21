// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shop_app/modules/Login/LoginScreen.dart';
import 'package:shop_app/shared/network/Local/cache.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String img;
  final String title;
  final String body;
  BoardingModel({
    required this.img,
    required this.title,
    required this.body,
  });
}

class OnBoarding_Screen extends StatefulWidget {
  OnBoarding_Screen({super.key});

  @override
  State<OnBoarding_Screen> createState() => _OnBoarding_ScreenState();
}

class _OnBoarding_ScreenState extends State<OnBoarding_Screen> {
  bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel(
        body: "on Board 1 body",
        img: 'assets/images/Shop.png',
        title: "on Board 1  title"),
    BoardingModel(
        body: "on Board 2 body",
        img: 'assets/images/Shop.png',
        title: "on Board 2  title"),
    BoardingModel(
        body: "on Board 3 body",
        img: 'assets/images/Shop.png',
        title: "on Board 3  title"),
  ];

  var boardingController = PageController();

  void onSubmit() {
    Cache_Helper.saveData(key: 'OnBoarding', value: true).then((value) {
      if (value == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  onSubmit();
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    if (index == boarding.length - 1) {
                      isLast = true;
                    } else {
                      isLast = false;
                    }
                  });
                },
                controller: boardingController,
                itemCount: boarding.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Image(
                      image: AssetImage(boarding[index].img),
                    )),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      boarding[index].title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      boarding[index].body,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    count: boarding.length,
                    controller: boardingController,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4)),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      onSubmit();
                    } else {
                      boardingController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            )
          ]),
        ));
  }
}
