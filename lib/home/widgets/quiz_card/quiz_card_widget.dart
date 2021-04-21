import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(16),
      decoration: new BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          new BorderSide(
            color: AppColors.border
          )
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            height: 40, width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          new SizedBox(height: 24),
          new Text(
            'Gerenciamento de Estado',
            style: AppTextStyles.heading15,
          ),
          new SizedBox(height: 24),
          new Row(
            children: [
              new Expanded(
                flex: 1,
                child: new Text(
                  '3 de 10',
                  style: AppTextStyles.body11,
                ),
              ),
              new Expanded(
                flex: 2,
                child: new ProgressIndicatorWidget(
                  value: 0.3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}