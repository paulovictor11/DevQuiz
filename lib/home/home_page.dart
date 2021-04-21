import 'package:DevQuiz/home/widgets/appbar/app_bar.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBarWidget(),
      body: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: new Column(
          children: [
            new SizedBox(height: 24),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new LevelButtonWidget(
                  label: 'Fácil',
                ),
                new LevelButtonWidget(
                  label: 'Médio',
                ),
                new LevelButtonWidget(
                  label: 'Difícil',
                ),
                new LevelButtonWidget(
                  label: 'Perito',
                ),
              ],
            ),
            new SizedBox(height: 24),
            new Expanded(
              child: new GridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                children: [
                  new QuizCardWidget(),
                  new QuizCardWidget(),
                  new QuizCardWidget(),
                  new QuizCardWidget(),
                  new QuizCardWidget(),
                  new QuizCardWidget(),
                ],
              ),
            ),
            new SizedBox(height: 8),
          ],
        ),
      )
    );
  }
}