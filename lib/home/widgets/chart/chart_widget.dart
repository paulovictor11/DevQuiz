import 'package:flutter/material.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 80, width: 80,
      child: new Stack(
        children: [
          new Center(
            child: new Container(
              height: 80, width: 80,
              child: new CircularProgressIndicator(
                strokeWidth: 10,
                value: .75,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          new Center(
            child: new Text(
              '75%',
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}