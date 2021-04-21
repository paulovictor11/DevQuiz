import 'package:flutter/material.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/core/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: AppGradients.linear
        ),
        child: new Center(
          child: new Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}