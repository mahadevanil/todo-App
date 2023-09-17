import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/constants/styles/text_styles.dart';
import 'package:todo/views/home/view/home_screen.dart';

import '../../../constants/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //*------------------------------------ added future delay to show splash animation
    Future.delayed(const Duration(seconds: 3), () {
      //*------------------------------ onSplash method is called
      onSplashLoad();
    });
  }

  void onSplashLoad() {
    //*-------------------------- routes to home screen
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Kstyles()
            .bold30(
              text: Constants.dbName,
            )
            .animate()
            .fade(
                delay: const Duration(milliseconds: 100),
                duration: 700.ms,
                curve: Curves.easeInOut)
            .then()
            .fadeOut(
                delay: const Duration(milliseconds: 1000),
                duration: 700.ms,
                curve: Curves.easeInOut),
      ),
    );
  }
}
