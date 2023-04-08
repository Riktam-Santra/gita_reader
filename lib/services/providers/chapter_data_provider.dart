import 'package:gita_reader/services/api/api.dart';
import 'package:gita_reader/services/models/multiple_chapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chapterDataProvider = FutureProvider<MultipleChapters>((ref) async {
  return await getAllChapters();
});
