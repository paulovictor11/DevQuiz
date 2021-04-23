import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {

  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {

  final controller = new ChallengeController();
  final pageController = new PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
        duration: new Duration(milliseconds: 300),
        curve: Curves.linear
      );
    }
  }

  void onSelected(bool value) {
    if (value) controller.qtdAnswer++;
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(102),
        child: new SafeArea(
          top: true,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new IconButton(
                icon: new Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              new ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => new QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
              
            ],
          )
        ),
      ),
      body: new PageView(
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        children: widget.questions.map((e) => new QuizWidget(
          question: e,
          onSelected: onSelected,
        )).toList(),
      ),
      bottomNavigationBar: new SafeArea(
        bottom: true,
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: new Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: new ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) {
                return new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (value < widget.questions.length)
                      new Expanded(
                        child: NextButtonWidget.normal(
                          label: "Pular",
                          onTap: nextPage,
                        ),
                      ),
                    if (value == widget.questions.length)
                      new SizedBox(width: 7),
                    if (value == widget.questions.length)
                      new Expanded(
                        child: NextButtonWidget.confirm(
                          label: 'Confirmar',
                          onTap: () => Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(builder: (builder) => new ResultPage(
                              title: widget.title,
                              length: widget.questions.length,
                              result: controller.qtdAnswer,
                            ))
                          )
                        ),
                      )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}