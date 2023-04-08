import 'single_verse.dart';

class MultipleVerses {
  final List<SingleVerse> verses;
  MultipleVerses(this.verses);

  factory MultipleVerses.fromJson(List<dynamic> json) {
    return MultipleVerses(
      json.map<SingleVerse>((e) => SingleVerse.fromJson(e)).toList(),
    );
  }
}
