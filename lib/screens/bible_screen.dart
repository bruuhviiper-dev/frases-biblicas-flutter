import 'package:flutter/material.dart';

import '../data/bible.dart';
import 'bible_chapters_screen.dart';

/// Bíblia completa (Almeida, domínio público): lista de livros por Testamento.
class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📖  Bíblia Sagrada')),
      body: FutureBuilder<List<BibleBook>>(
        future: BibleRepository.instance.load(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final books = snap.data!;
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: books.length + 2,
            itemBuilder: (context, i) {
              // Cabeçalhos: 0 = Antigo Testamento; após os 39, Novo Testamento.
              if (i == 0) return const _Header('Antigo Testamento');
              if (i == BibleRepository.oldTestamentCount + 1) {
                return const _Header('Novo Testamento');
              }
              final bookIndex =
                  i <= BibleRepository.oldTestamentCount ? i - 1 : i - 2;
              final b = books[bookIndex];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Text(b.abbrev.substring(0, b.abbrev.length.clamp(0, 3)),
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w800)),
                ),
                title: Text(b.name,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text('${b.chapterCount} capítulos'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => BibleChaptersScreen(
                          books: books, bookIndex: bookIndex)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
      child: Text(title.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: Theme.of(context).colorScheme.primary,
          )),
    );
  }
}
