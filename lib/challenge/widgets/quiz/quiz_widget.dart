import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.question, required this.onSelected}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {

  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.awnswers[index];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new SizedBox(height: 64),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: new Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
          ),
          new SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnswers.length; i++)
            new AnswerWidget(
              answer: answer(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(new Duration(seconds: 1))
                  .then((_) => widget.onSelected(value));
              },
            )
        ],
      ),
    );
  }
}