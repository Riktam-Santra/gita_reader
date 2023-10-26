import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/providers/chapter_data_provider.dart';
import '../services/providers/chapter_id_provider.dart';
import '../services/providers/verse_id_provider.dart';
import 'about_chapter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Chapters"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[700]!, Colors.orange[700]!])),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer(builder: (context, ref, child) {
            return ref.watch(chapterDataProvider).when(
                  data: (data) => ListView(
                    children: data.chapters
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  color:
                                      const Color.fromARGB(150, 255, 255, 255),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(10),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    subtitle: Text(
                                      e.chapterSummary,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onTap: () {
                                      ref
                                          .read(verseIdProvider.notifier)
                                          .setState(0);
                                      ref
                                          .read(chapterIdProvider.notifier)
                                          .setState(e.id);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                AboutChapters(chapter: e)),
                                      );
                                    },
                                  ),
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
                    child: CircularProgressIndicator(),
                  ),
                );
          }),
        ),
      ),
    );
  }
}
