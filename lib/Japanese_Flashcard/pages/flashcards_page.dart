import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/components/app/custom_appbar.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/notifiers/flashcard_notifier.dart';
import 'package:provider/provider.dart';

import '../components/flashcard_page/card_1.dart';
import '../components/flashcard_page/card_2.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      final flashcardNotifier = Provider.of<FlashcardNotifier>(context, listen: false);
      flashcardNotifier.runSlideCard1();
      flashcardNotifier.generateAllSelectedWords();
      flashcardNotifier.generateCurrentWord(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotifier>(
        builder: (_, notifier, __) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
              child: CustomAppbar()),
          body: IgnorePointer(
            ignoring: notifier.ignoreTouches,
            child: Stack(
              children: [
                Card1(),
                Card2(),
              ],
            ),
          ),
        ),
    );
  }
}


