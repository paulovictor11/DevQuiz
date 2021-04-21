import 'dart:convert';

import 'package:DevQuiz/shared/models/awnser_model.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnswers;

  QuestionModel({required this.title, required this.awnswers}) : assert(awnswers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'awnswers': awnswers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      awnswers: List<AwnserModel>.from(map['awnswers']?.map((x) => AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}
