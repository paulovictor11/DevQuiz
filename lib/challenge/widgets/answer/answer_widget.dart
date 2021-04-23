import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {

  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.isSelected = false,
    this.disabled = false
  }) : super(key: key);

  Color get _selectedColorRight => this.answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => this.answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => this.answer.isRight ? AppColors.lightGreen: AppColors.lightRed;
  Color get _selectedBorderCardRight => this.answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => this.answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => this.answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      ignoring: disabled,
      child: new GestureDetector(
        onTap: () {
          onTap(answer.isRight);
        },
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: new BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              new BorderSide(color: isSelected ? _selectedBorderCardRight : AppColors.white)
            )
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Expanded(
                child: new Text(
                  this.answer.title,
                  style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                ),
              ),
              new SizedBox(width: 24),
              new Container(
                height: 24, width: 24,
                decoration: new BoxDecoration(
                  color: isSelected ? _selectedColorRight : AppColors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.fromBorderSide(
                    new BorderSide(
                      color: isSelected ? _selectedBorderRight : AppColors.border
                    )
                  )
                ),
                child: isSelected
                  ? new Icon(
                    _selectedIconRight,
                    size: 16,
                    color: AppColors.white,
                  ) : null
              )
            ],
          ),
        ),
      ),
    );
  }
}