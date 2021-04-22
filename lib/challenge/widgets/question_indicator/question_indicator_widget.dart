import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {

  final int currentPage;
  final int length;

  const QuestionIndicatorWidget({Key? key, required this.currentPage, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: new Column(
        children: [
          new SizedBox(height: 16),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Text(
                'Questão $currentPage',
                style: AppTextStyles.body,
              ),
              new Text(
                'de $length',
                style: AppTextStyles.body,
              )
            ],
          ),
          new SizedBox(height: 16),
          new ProgressIndicatorWidget(value: currentPage / length)
        ],
      ),
    );
  }
}