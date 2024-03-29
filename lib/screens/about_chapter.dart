import 'package:gita_reader/screens/verse_reader.dart';
import 'package:gita_reader/services/models/single_chapter.dart';
import 'package:gita_reader/services/providers/all_verses_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutChapters extends ConsumerStatefulWidget {
  final SingleChapter chapter;
  const AboutChapters({super.key, required this.chapter});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutChaptersState();
}

class _AboutChaptersState extends ConsumerState<AboutChapters> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter: ${widget.chapter.id}"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.chapter.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget.chapter.chapterSummary,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Text(
                "Verses",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ref.watch(allVersesProvider).when(
                            data: (data) => ListView(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              children: data.verses
                                  .map(
                                    (e) => ListTile(
                                      leading: const Icon(Icons.abc),
                                      title: Text(
                                        "Verse ${e.verseNumber}",
                                      ),
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (builder) => VerseReader(
                                            chapter: widget.chapter,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            error: (error, stacktrace) => const Center(
                              child: Text("Something went wrong"),
                            ),
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                          );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
