import 'package:flutter/material.dart';

import '../data/bible.dart';
import 'bible_reader_screen.dart';

/// Grade de capítulos de um livro.
class BibleChaptersScreen extends StatelessWidget {
  const BibleChaptersScreen({super.key, required this.book});

  final BibleBook book;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(book.name)),
      body: GridView.count(
        crossAxisCount: 5,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          for (var ch = 1; ch <= book.chapterCount; ch++)
            Material(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(14),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        BibleReaderScreen(book: book, chapterIndex: ch - 1),
                  ),
                ),
                child: Center(
                  child: Text('$ch',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: scheme.onPrimaryContainer)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
