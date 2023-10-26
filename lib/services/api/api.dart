import 'dart:convert';

import '../models/multiple_chapters.dart';
import '../models/multiple_verses.dart';
import 'package:http/http.dart' as http;

import '../models/single_chapter.dart';
import '../models/single_verse.dart';

const apiKey = 'c8a0d440eamsh1948e5f7eb94cb0p13f671jsn6304cb3b707b';

Future<SingleChapter> getParticularChapter(int id) async {
  final response = await http.get(
      Uri.parse("https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$id/"),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
      });

  return SingleChapter.fromJson(
    jsonDecode(utf8.decode(response.bodyBytes)),
  );
}

Future<MultipleChapters> getAllChapters() async {
  final response = await http.get(
      Uri.parse("https://bhagavad-gita3.p.rapidapi.com/v2/chapters/"),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
      });

  return MultipleChapters.fromJson(
    jsonDecode(
      utf8.decode(response.bodyBytes),
    ),
  );
}

Future<SingleVerse> getParticularVerse(int verseId, int chapterId) async {
  final response = await http.get(
      Uri.parse(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapterId/verses/$verseId/'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
      });

  return SingleVerse.fromJson(
    jsonDecode(utf8.decode(response.bodyBytes)),
  );
}

Future<MultipleVerses> getAllVersesFromChapter(int chapterId) async {
  final response = await http.get(
      Uri.parse(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapterId/verses/'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
      });

  return MultipleVerses.fromJson(
    jsonDecode(utf8.decode(response.bodyBytes)),
  );
}
