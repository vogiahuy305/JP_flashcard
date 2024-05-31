import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/constants.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/notifiers/flashcard_notifier.dart';
import 'package:provider/provider.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({super.key});

  @override
  State<TTSButton> createState() => _TTSButtonState();
}

class _TTSButtonState extends State<TTSButton> {

  bool _isTapped = false;
  FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    // TODO: implement initState
    _setUpTts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotifier>(
      builder: (_,notifier,__) => Expanded(
          child: IconButton(
              onPressed: () {
                _runTts(text: notifier.word1.hiragana);
                _isTapped = true;
                setState(() {});
                Future.delayed(Duration(milliseconds: 500),() {
                  _isTapped = false;
                  setState(() {});
                },);
              },
              icon: Icon(Icons.multitrack_audio,size: 50,),color: _isTapped ? Colors.grey : Colors.black,)),
    );
  }

  _setUpTts() async{
    await _tts.setLanguage('ja-JP');
    await _tts.setSpeechRate(0.40);
  }

  _runTts({required String text}) async{
    await _tts.speak(text);
  }
}
