import 'package:gita_reader/services/api/api.dart';
import 'package:gita_reader/services/models/multiple_verses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chapter_id_provider.dart';

final allVersesProvider = FutureProvider<MultipleVerses>((ref) async {
  final chapterId = ref.watch(chapterIdProvider);
  return await getAllVersesFromChapter(chapterId);
});
