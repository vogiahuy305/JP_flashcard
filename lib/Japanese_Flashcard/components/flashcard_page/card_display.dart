import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/components/flashcard_page/tts_button.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/notifiers/flashcard_notifier.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({required this.isCard1, super.key});

  final bool isCard1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<FlashcardNotifier>(
        builder: (_,notifier,__) =>  isCard1 ?
        Column(
          children: [
            buildImage(notifier, notifier.word1.vietnamese),
            buildTextBox(notifier.word1.vietnamese, context, 1),
          ],
        ) :
        Column(
          children: [
            buildImage(notifier, notifier.word1.vietnamese),
            buildTextBox(notifier.word1.hiragana, context, 2),
            buildTextBox(notifier.word1.romaji, context, 1),
            TTSButton(),
          ],
        ),
      ),
    );
  }

  Expanded buildTextBox(String text, BuildContext context,int flex) {
    return Expanded(
        flex: flex,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity   ,
          child: FittedBox(
            child: Text(text,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ));
  }

  Expanded buildImage(FlashcardNotifier notifier, String image) {
    return Expanded(
            flex: 2,
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset('assets/images/${notifier.topic}/${image}.png'),
        ));
  }
}