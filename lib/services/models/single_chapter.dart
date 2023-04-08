class SingleChapter {
  final int id;
  final String name;
  final String slug;
  final String nameTransliterated;
  final String nameTranslated;
  final int versesCount;
  final int chapterNumber;
  final String nameMeaning;
  final String chapterSummary;
  final String chapterSummaryHindi;

  SingleChapter(
    this.id,
    this.name,
    this.slug,
    this.nameTransliterated,
    this.nameTranslated,
    this.versesCount,
    this.chapterNumber,
    this.nameMeaning,
    this.chapterSummary,
    this.chapterSummaryHindi,
  );

  factory SingleChapter.fromJson(Map<String, dynamic> json) {
    return SingleChapter(
      json['id'],
      json['name'],
      json['slug'],
      json['name_transliterated'],
      json['name_translated'],
      json['verses_count'],
      json['chapter_number'],
      json['name_meaning'],
      json['chapter_summary'],
      json['chapter_summary_hindi'],
    );
  }

  toJson() => {
        "id": id,
        "name": name,
        'slug': slug,
        'name_transliterated': nameTransliterated,
        'name_translated': nameTranslated,
        'verses_count': versesCount,
        'chapter_number': chapterNumber,
        'name_meaning': nameMeaning,
        'chapter_summary': chapterSummary,
        'chapter_summary_hindi': chapterSummaryHindi,
      };
}
