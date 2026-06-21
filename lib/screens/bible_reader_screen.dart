import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/bible.dart';
import '../widgets/share_helper.dart';

/// Leitura de um capítulo, versículo por versículo.
class BibleReaderScreen extends StatelessWidget {
  const BibleReaderScreen({
    super.key,
    required this.book,
    required this.chapterIndex,
  });

  final BibleBook book;
  final int chapterIndex; // base 0

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final verses = book.chapters[chapterIndex];
    final chapter = chapterIndex + 1;
    return Scaffold(
      appBar: AppBar(title: Text('${book.name} $chapter')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
        itemCount: verses.length,
        itemBuilder: (context, i) {
          final n = i + 1;
          final text = verses[i];
          final ref = '${book.name} $chapter:$n';
          return InkWell(
            onTap: () => _verseMenu(context, text, ref),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.lora(
                      fontSize: 17,
                      height: 1.6,
                      color: scheme.onSurface),
                  children: [
                    TextSpan(
                        text: '$n ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: scheme.primary)),
                    TextSpan(text: text),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _verseMenu(BuildContext context, String text, String ref) {
    final share = '"$text"\n— $ref\n\n📖 Frases Bíblicas';
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(ref,
                  style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
            ListTile(
              leading: const Icon(Icons.copy_rounded),
              title: const Text('Copiar'),
              onTap: () async {
                await ShareHelper.copy(share);
                if (ctx.mounted) Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_rounded),
              title: const Text('Compartilhar'),
              onTap: () {
                Navigator.pop(ctx);
                ShareHelper.share(share);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
