import 'package:gita_reader/services/api/api.dart';
import 'package:gita_reader/services/models/single_verse.dart';
import 'package:gita_reader/services/providers/chapter_id_provider.dart';
import 'package:gita_reader/services/providers/verse_id_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final particularVerseProvider = FutureProvider<SingleVerse>((ref) async {
  final verseId = ref.watch(verseIdProvider);
  final chapterId = ref.watch(chapterIdProvider);
  return await getParticularVerse(verseId, chapterId);
});
