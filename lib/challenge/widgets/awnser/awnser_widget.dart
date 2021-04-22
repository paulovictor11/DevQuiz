import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {

  final AwnserModel awnser;
  final bool isSelected;
  final bool disabled;
  final VoidCallback onTap;

  const AwnserWidget({
    Key? key,
    required this.awnser,
    required this.onTap,
    this.isSelected = false,
    this.disabled = false
  }) : super(key: key);

  Color get _selectedColorRight => this.awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => this.awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => this.awnser.isRight ? AppColors.lightGreen: AppColors.lightRed;
  Color get _selectedBorderCardRight => this.awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => this.awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => this.awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      ignoring: disabled,
      child: new GestureDetector(
        onTap: onTap,
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
                  this.awnser.title,
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