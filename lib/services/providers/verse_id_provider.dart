import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerseIdNotifier extends StateNotifier<int> {
  VerseIdNotifier() : super(0);

  void increment() => state++;

  void decrement() {
    if (state != 0) {
      state--;
    }
  }

  void setState(int newState) => state = newState;
}

final verseIdProvider = StateNotifierProvider<VerseIdNotifier, int>((ref) {
  return VerseIdNotifier();
});
