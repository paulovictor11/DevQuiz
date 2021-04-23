import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/core/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future.delayed(
      new Duration(seconds: 2)
    ).then((value) => Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (builder) => new HomePage())
    ));

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