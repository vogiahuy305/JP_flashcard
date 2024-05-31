import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

import '../notifiers/flashcard_notifier.dart';

loadSession({required BuildContext context, required String topic}){

  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlashcardsPage(),));
  Provider.of<FlashcardNotifier>(context, listen: false).setTopic(topic: topic);



}