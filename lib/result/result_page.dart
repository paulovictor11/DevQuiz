import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {

  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Column(
              children: [
                new Image.asset(AppImages.trophy),
                new SizedBox(height: 10),
                new Text(
                  'Parabéns!',
                  style: AppTextStyles.heading40,
                ),
                new SizedBox(height: 16),
                new Text.rich(
                  new TextSpan(
                    text: 'Você concluiu',
                    style: AppTextStyles.body,
                    children: [
                      new TextSpan(text: '\n$title', style: AppTextStyles.bodyBold),
                      new TextSpan(text: '\ncom $result de $length acertos', style: AppTextStyles.body)
                    ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: new NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share(
                              'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive: ${result/length}% de aproveitamento'
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                new SizedBox(height: 24),
                new Row(
                  children: [
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: new NextButtonWidget.text(
                          label: 'Voltar ao início',
                          onTap: () => Navigator.of(context).pop()
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}