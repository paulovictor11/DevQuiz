import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: [
          new Text(
            title,
            style: AppTextStyles.heading,
          ),
          new SizedBox(height: 24),
          new AwnserWidget(
            isRight: false,
            isSelected: true,
            title: 'Kit de desenvolvimento de interface de usuário'
          ),
          new AwnserWidget(
            isRight: true,
            isSelected: true,
            title: 'Possibilita a criação de aplicativos compilados nativamente'
          ),
          new AwnserWidget(
            title: 'Acho que é uma marca de café do Himalaia'
          ),
          new AwnserWidget(
            title: 'Possibilita a criação de desktops que são muito incríveis'
          )
        ],
      ),
    );
  }
}