import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {

  final String title;
  final bool isRight;
  final bool isSelected;

  const AwnserWidget({
    Key? key,
    required this.title,
    this.isRight = false,
    this.isSelected = false
  }) : super(key: key);

  Color get _selectedColorRight => isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => isRight ? AppColors.lightGreen: AppColors.lightRed;
  Color get _selectedBorderCardRight => isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return new Container(
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
              title,
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
    );
  }
}