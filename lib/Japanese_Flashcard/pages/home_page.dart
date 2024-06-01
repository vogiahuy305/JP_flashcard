import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/animations/fade_in_animation.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/components/home_page/topic_tile.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/data/words.dart';

class JapaneseApp_PageHome extends StatefulWidget {
  const JapaneseApp_PageHome({super.key});

  @override
  State<JapaneseApp_PageHome> createState() => _JapaneseApp_PageHomeState();
}

class _JapaneseApp_PageHomeState extends State<JapaneseApp_PageHome> {
  List<String> _topics = [];


  //thêm các topic từ word vào _topics => sắp xếp theo thứ tự
  @override
  initState() {
    for(var t in words) {
      if(!_topics.contains(t.topic)){
        _topics.add(t.topic);
      }
      _topics.sort();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //biến khai báo để lấy kích thước màn hình
    final padding = size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        //thanh appbar hiển thị tên ứng dụng
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        toolbarHeight: size.height * 0.08, //chiều cao của thanh appbar
        title: FadeInAnimation(
          child: Text("Học từ vựng tiếng Nhật".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22,),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: padding,right: padding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.45 ,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.04),
                  child: FadeInAnimation(
                      child: Image.asset("assets/images/Homepage/Japan.png"))
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: _topics.length,
                    (context, index) => TopicTile(topic: _topics[index])
                ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2
                ))
          ],
        ),
      )
    );
  }
}



