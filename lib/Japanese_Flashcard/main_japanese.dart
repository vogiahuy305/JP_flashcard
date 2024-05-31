import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard//pages/home_page.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/themes.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/notifiers/flashcard_notifier.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FlashcardNotifier())
    ],
      child: const JapaneseApp())
  );

}

class JapaneseApp extends StatelessWidget {
  const JapaneseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Japanese Flashcard App",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: JapaneseApp_PageHome(),
    );
  }
}
