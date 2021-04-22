import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = new HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return new Scaffold(
        appBar: new AppBarWidget(user: controller.user!),
        body: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  children: controller.quizzes!.map((e) => new QuizCardWidget(
                    title: e.title,
                    completed: '${e.questionAwnsered} de ${e.questions.length}',
                    percent: e.questionAwnsered / e.questions.length,
                    onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => new ChallengePage(questions: e.questions))
                    ),
                  )).toList(),
                ),
              ),
              new SizedBox(height: 8),
            ],
          ),
        )
      );
    }

    return new Scaffold(
      body: new Center(
        child: new CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        ),
      ),
    );
  }
}