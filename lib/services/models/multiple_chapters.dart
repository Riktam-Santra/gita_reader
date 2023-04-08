import 'single_chapter.dart';

class MultipleChapters {
  final List<SingleChapter> chapters;
  MultipleChapters(this.chapters);

  factory MultipleChapters.fromJson(List<dynamic> json) {
    return MultipleChapters(
      json.map((e) => SingleChapter.fromJson(e)).toList(),
    );
  }
}
