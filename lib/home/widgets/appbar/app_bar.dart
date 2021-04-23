import 'package:DevQuiz/home/widgets/score_card/score_card_widget.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user}) : super(
    preferredSize: Size.fromHeight(250),
    child: new Container(
      height: 250,
      child: new Stack(
        children: [
          new Container(
            height: 161,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: new BoxDecoration(
              gradient: AppGradients.linear
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  new TextSpan(
                    text: 'Olá, ',
                    style: AppTextStyles.title,
                    children: [
                      new TextSpan(
                        text: user.name,
                        style: AppTextStyles.titleBold
                      )
                    ]
                  )
                ),
                new Container(
                  width: 58, height: 58,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: new DecorationImage(
                      image: new NetworkImage(user.photoUrl)
                    )
                  ),
                )
              ],
            ),
          ),
          new Align(
            alignment: Alignment(0, 1),
            child: new ScoreCardWidget(percent: user.score/100)
          )
        ],
      ),
    )
  );
  
}