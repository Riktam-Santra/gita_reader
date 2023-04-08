class SingleVerse {
  final int id;
  final int verseNumber;
  final int chapterNumber;
  final String text;
  final List<Translation> translations;
  SingleVerse(
    this.id,
    this.verseNumber,
    this.chapterNumber,
    this.text,
    this.translations,
  );
  factory SingleVerse.fromJson(Map<String, dynamic> json) {
    return SingleVerse(
      json['id'],
      json['verse_number'],
      json['chapter_number'],
      json['text'],
      (json['translations'] as List<dynamic>).map<Translation>((e) {
        return Translation.fromJson(e);
      }).toList(),
    );
  }

  toJson() => {
        'id': id,
        'verse_number': verseNumber,
        'chapter_number': chapterNumber,
        'text': text,
        'translations': translations,
      };
}

class Translation {
  final int id;
  final String description;
  final String authorName;
  final String language;
  Translation(
    this.id,
    this.description,
    this.authorName,
    this.language,
  );
  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      json['id'],
      json['description'],
      json['author_name'],
      json['language'],
    );
  }

  toJson() => {
        "id": id,
        "description": description,
        "author_name": authorName,
        "language": language,
      };
}
