import 'package:DevQuiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class ScoreCardWidget extends StatelessWidget {

  final double percent;

  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: new Container(
        height: 136,
        decoration: new BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.fromBorderSide(
            new BorderSide(
              color: AppColors.border
            )
          ),
        ),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Expanded(
                flex: 1,
                child: new ChartWidget(
                  percent: percent,
                ),
              ),
              new SizedBox(width: 24),
              new Expanded(
                flex: 3,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text('Vamos começar', style: AppTextStyles.heading),
                    new Text('Complete os desafios e avançe em conhecimento', style: AppTextStyles.body),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}