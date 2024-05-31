import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/notifiers/flashcard_notifier.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

import '../../pages/home_page.dart';

class ResultBox extends StatefulWidget {
  const ResultBox({super.key});

  @override
  State<ResultBox> createState() => _ResultBoxState();
}

class _ResultBoxState extends State<ResultBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotifier>(
      builder:(_,notifier,__) => AlertDialog(
        title: Text(
          notifier.isSessionCompleted ? "Hoàn thành chủ đề" : "Kết thúc chủ đề",
          textAlign: TextAlign.center,
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              notifier.isSessionCompleted ? SizedBox() :ElevatedButton(
                onPressed: () {
                  notifier.reset();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                      FlashcardsPage(),));
                },
                child: Text("Kiểm tra lại"),
              ),
              ElevatedButton(
                onPressed: () {
                  notifier.reset();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => JapaneseApp_PageHome(),),
                        (route) => false,);
                },
                child: Text("Trang chủ"),
              )
            ],
          )
        ],
      ),
    );
  }
}

