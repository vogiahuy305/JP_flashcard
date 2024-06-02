import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/animations/fade_in_animation.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/constants.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/utils/methods.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    Key? key,
    required this.topic,
  }): super(key: key);
  final String topic;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        onTap: () {
          loadSession(context: context, topic: topic);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(kCircularBorderRadius)
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Hero(
                          tag: topic,
                          child: Image.asset('assets/images/topics/$topic.png')),
                    )
                ),
                //tên topic hiển thị ra trang chủ
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(topic),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}