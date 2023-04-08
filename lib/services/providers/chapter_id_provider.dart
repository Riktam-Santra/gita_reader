import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterIdNotifier extends StateNotifier<int> {
  ChapterIdNotifier() : super(0);

  void increment() => state++;

  void decrement() {
    if (state != 0) {
      state--;
    }
  }

  void setState(int newState) => state = newState;
}

final chapterIdProvider = StateNotifierProvider<ChapterIdNotifier, int>((ref) {
  return ChapterIdNotifier();
});
