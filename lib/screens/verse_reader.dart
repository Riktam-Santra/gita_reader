import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/models/single_chapter.dart';
import '../services/providers/all_verses_provider.dart';
import '../services/providers/verse_id_provider.dart';

class VerseReader extends ConsumerStatefulWidget {
  final SingleChapter chapter;
  const VerseReader({
    super.key,
    required this.chapter,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerseReaderState();
}

class _VerseReaderState extends ConsumerState<VerseReader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.chapter.id} | ${widget.chapter.name}"),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return ref.watch(allVersesProvider).when(
                data: (data) {
                  var hindiTextList =
                      data.verses[ref.watch(verseIdProvider)].text.split("\n");
                  final verseHeading = Text(
                    hindiTextList[0],
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  );
                  final verseTexts =
                      hindiTextList.getRange(1, hindiTextList.length - 1).map(
                            (e) => Text(
                              e,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );

                  final translationList =
                      data.verses[ref.watch(verseIdProvider)].translations
                          .where((element) => element.language == "english")
                          .map(
                            (e) => Text(
                              e.description,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                          .toList();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Column(
                        children: [verseHeading, ...verseTexts],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [translationList[0]],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      // Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: data.verses.first.id !=
                                    data.verses[ref.watch(verseIdProvider)].id
                                ? () {
                                    ref
                                        .read(verseIdProvider.notifier)
                                        .decrement();
                                  }
                                : null,
                            icon: const Icon(Icons.arrow_back),
                            label: const Text(
                              "Previous Verse",
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: data.verses.last.id !=
                                    data.verses[ref.watch(verseIdProvider)].id
                                ? () {
                                    ref
                                        .read(verseIdProvider.notifier)
                                        .increment();
                                  }
                                : null,
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text(
                              "Next Verse",
                            ),
                          )
                        ],
                      )
                    ]),
                  );
                },
                error: (error, stacktrace) => const Center(
                  child: Text("Something went wrong"),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
        }),
      ),
    );
  }
}
