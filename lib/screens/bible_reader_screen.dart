import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/bible.dart';
import '../widgets/share_helper.dart';

/// Leitura de um capítulo com navegação fluida (capítulo anterior/próximo,
/// atravessando livros nas bordas).
class BibleReaderScreen extends StatefulWidget {
  const BibleReaderScreen({
    super.key,
    required this.books,
    required this.bookIndex,
    required this.chapterIndex,
  });

  final List<BibleBook> books;
  final int bookIndex;
  final int chapterIndex;

  @override
  State<BibleReaderScreen> createState() => _BibleReaderScreenState();
}

class _BibleReaderScreenState extends State<BibleReaderScreen> {
  late int _book = widget.bookIndex;
  late int _chap = widget.chapterIndex;
  final _scroll = ScrollController();

  BibleBook get book => widget.books[_book];

  bool get _hasPrev => _book > 0 || _chap > 0;
  bool get _hasNext =>
      _book < widget.books.length - 1 || _chap < book.chapterCount - 1;

  void _go(int dir) {
    setState(() {
      if (dir < 0) {
        if (_chap > 0) {
          _chap--;
        } else if (_book > 0) {
          _book--;
          _chap = book.chapterCount - 1;
        }
      } else {
        if (_chap < book.chapterCount - 1) {
          _chap++;
        } else if (_book < widget.books.length - 1) {
          _book++;
          _chap = 0;
        }
      }
    });
    if (_scroll.hasClients) _scroll.jumpTo(0);
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final verses = book.chapters[_chap];
    final chapter = _chap + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('${book.name} $chapter'),
        actions: [
          IconButton(
            tooltip: 'Capítulos',
            icon: const Icon(Icons.grid_view_rounded),
            onPressed: () => _chapterPicker(context),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scroll,
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
                      fontSize: 17, height: 1.6, color: scheme.onSurface),
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _hasPrev ? () => _go(-1) : null,
                  icon: const Icon(Icons.chevron_left_rounded),
                  label: const Text('Anterior'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _hasNext ? () => _go(1) : null,
                  icon: const Icon(Icons.chevron_right_rounded),
                  label: const Text('Próximo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _chapterPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text('${book.name} — capítulos',
                    style: const TextStyle(fontWeight: FontWeight.w800)),
              ),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 5,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    for (var c = 1; c <= book.chapterCount; c++)
                      Material(
                        color: c - 1 == _chap
                            ? Theme.of(ctx).colorScheme.primary
                            : Theme.of(ctx).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(ctx);
                            setState(() => _chap = c - 1);
                            if (_scroll.hasClients) _scroll.jumpTo(0);
                          },
                          child: Center(
                            child: Text('$c',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: c - 1 == _chap
                                        ? Theme.of(ctx).colorScheme.onPrimary
                                        : Theme.of(ctx)
                                            .colorScheme
                                            .onPrimaryContainer)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
              child:
                  Text(ref, style: const TextStyle(fontWeight: FontWeight.w800)),
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
