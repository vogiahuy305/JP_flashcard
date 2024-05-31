import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/animations/slide_animation.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/components/flashcard_page/result_box.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/constants.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/data/words.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/enums/slide_direction.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/models/word.dart';

class FlashcardNotifier extends ChangeNotifier{

  List<Word> incorrectCards = []; //list các từ chưa thuộc


  String topic = "";// topic được chọn khi chuyển sang trang mới
  Word word1 = Word(topic: "", vietnamese: "Loading Arrow", hiragana: "", romaji: "");
  Word word2 = Word(topic: "", vietnamese: "Loading Arrow", hiragana: "", romaji: "");
  List<Word> selectedWords = [];

  bool isFirstRound = true,  //biến kiểm tra vòng từ vựng bắt đầu
      isRoundCompleted = false,  // biến kiểm tra vòng từ vựng kết thúc hay chưa
      isSessionCompleted = false; // biến kiểm tra chủ đề đã được hoàn thành hết chưa

  reset(){ // hàm thiết lập lại trạng thái ban đầu của một vòng từ vựng
    isFirstRound = true;
    isRoundCompleted = false;
    isSessionCompleted = false;
  }

  setTopic({required String topic}){ //hàm xác định chủ đề được chọn
    this.topic = topic;
    notifyListeners();
  }

  generateAllSelectedWords(){ // hàm tạo
    selectedWords.clear();
    isRoundCompleted = false;
    if(isFirstRound) {
      selectedWords = words.where((element) => element.topic == topic).toList();
    }
    else{
      selectedWords = incorrectCards.toList();
      selectedWords.clear();
    }
  }

  generateCurrentWord({required BuildContext context}) {
    if (selectedWords.isNotEmpty) {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    }
    else {
      if(incorrectCards.isEmpty){
        isSessionCompleted = true;
        print("session completed: $isSessionCompleted" );
      }
      isRoundCompleted = true;
      isFirstRound = false;
      Future.delayed(Duration(milliseconds: 500), () {
        showDialog(context: context, builder: (context) => ResultBox(),);
      });
    }

    Future.delayed(const Duration(milliseconds: kSlideAwayDuration), () {
      word2 = word1;
    });
  }

  updateCardOutcome({required Word word, required bool isCorrect}){
    if(!isCorrect){
      incorrectCards.add(word);
    }
    incorrectCards.forEach((element) => print(element.vietnamese));
    notifyListeners();
  }

  //Hiệu ứng Animation

  bool ignoreTouches = true;

  setIgnoreTouch({required bool ignore}){
   ignoreTouches = ignore;
   notifyListeners();
  }

  SlideDirection swipedDirection = SlideDirection.none;

  bool slideCard1 = false, //
       flipCard1 = false, // biến khởi tạo chuyển động của card 1
       flipCard2 = false, // biến khởi tạo chuyển động của card 2
       swipeCard2 = false; // biến khởi tạo hướng vuốt flashcard

  bool resetSlideCard1 = false,
       resetFlipCard1 = false,
       resetFlipCard2 = false,
       resetSwipeCard2 = false;

  runSlideCard1(){
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1(){
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  resetCard1(){
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slideCard1 = false;

    flipCard1 = false;
  }

  runFlipCard2(){
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}){
    swipedDirection = direction;
    resetSwipeCard2 = false;
    swipeCard2 = true;
    notifyListeners();
  }

  resetCard2(){
    resetSwipeCard2 = true;
    resetFlipCard2 = true;
    swipeCard2 = false;
    flipCard2 = false;
  }
}