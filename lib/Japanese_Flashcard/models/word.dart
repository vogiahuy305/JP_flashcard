class Word {
  final String topic, vietnamese, hiragana, romaji;

  Word({
    required this.topic,
    required this.vietnamese,
    required this.hiragana,
    required this.romaji
  });
}
  //
  // Map<String, dynamic> toJson(){
  //   return{
  //     'topic': this.topic,
  //     'vietnamese' : this.vietnamese,
  //     'hiragana' : this.hiragana,
  //     'romaji' : this.romaji,
  //     'image' : this.image
  //   };
  // }
  //
  // factory Vocabulary.fromJson(Map<String, dynamic> map){
  //   return Vocabulary(
  //       id: map[''] as String,
  //       ngay_sinh: map['ngay_sinh'] as String,
  //       que_quan: map['que_quan'] as String,
  //       ten: map['ten'] as String
  //   );
//   }
// }
//
// class VocabSnapShot{
//   Vocabulary vocab;
//   DocumentReference docRef;
//
//   VocabSnapShot({required this.vocab, required this.docRef});
//
//   factory VocabSnapShot.fromdocSnap(z)
// }