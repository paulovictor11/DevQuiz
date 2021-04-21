import 'dart:convert';

import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString('assets/database/user.json');
    final user = new UserModel.fromJson(response);

    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString('assets/database/quizzes.json');
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => new QuizModel.fromMap(e)).toList();

    return quizzes;
  }
}