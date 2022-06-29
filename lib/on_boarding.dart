import 'dart:ui';
import 'package:algoriza_task1/my_button.dart';
import 'package:algoriza_task1/on_boarding_model.dart';
import 'package:algoriza_task1/shared.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/1.PNG',
      title: 'Get food delivery to your doorstep asap',
      content:
          'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
    ),
    BoardingModel(
      image: 'assets/images/2.PNG',
      title: 'Buy Any Food from your favorite restaurant',
      content:
          'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
    ),
  ];

  Color exColor = const Color(0xffe7bb7e);
  Color secondaryColor = const Color(0xfffaf2e7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: MyButton(
              buttonBorder: 30,
              buttonColor: secondaryColor,
              textColor: Colors.black,
              width: 15,
              text: 'Skip',
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 10,
          bottom: 20,
          start: 10,
          end: 10,
        ),
        child: Column(
          children: [
            const Text(
              'Food Delivery',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                  controller: boardController,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              effect: WormEffect(
                dotWidth: 20,
                dotHeight: 8,
                dotColor: Colors.grey,
                activeDotColor: exColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account ?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(model.content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ))
      ],
    );
  }
}
