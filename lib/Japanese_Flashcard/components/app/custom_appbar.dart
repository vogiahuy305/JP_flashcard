import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/constants.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

import '../../notifiers/flashcard_notifier.dart';
import '../../pages/home_page.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotifier>(
      builder: (_, notifier, __) => AppBar(
        actions: [
          IconButton(
              onPressed: () {
                notifier.reset();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) => FlashcardsPage(),),
                      (route) => false,);
              },
              icon: Icon(Icons.refresh))
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
                  onPressed: () {
                    notifier.reset();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) => JapaneseApp_PageHome(),),
                          (route) => false,);
                  },
                  icon: Icon(Icons.home))
        ),
        title: Text(notifier.topic),
      ),
    );
  }
}
