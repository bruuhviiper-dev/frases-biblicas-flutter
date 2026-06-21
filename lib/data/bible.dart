import 'dart:convert';

import 'package:flutter/services.dart';

/// Um livro da Bíblia: nome, sigla e capítulos (cada capítulo = lista de
/// versículos, em ordem).
class BibleBook {
  BibleBook(this.name, this.abbrev, this.chapters);
  final String name;
  final String abbrev;
  final List<List<String>> chapters;
  int get chapterCount => chapters.length;
}

/// Carrega a Bíblia (Almeida, domínio público) do asset, uma única vez.
class BibleRepository {
  BibleRepository._();
  static final BibleRepository instance = BibleRepository._();

  List<BibleBook>? _books;

  Future<List<BibleBook>> load() async {
    if (_books != null) return _books!;
    final raw = await rootBundle.loadString('assets/bible/almeida.json');
    final data = jsonDecode(raw) as List;
    _books = [
      for (final b in data)
        BibleBook(
          b['n'] as String,
          b['a'] as String,
          [
            for (final c in (b['c'] as List))
              [for (final v in (c as List)) v as String]
          ],
        )
    ];
    return _books!;
  }

  /// Os 39 primeiros livros são o Antigo Testamento; o resto, o Novo.
  static const int oldTestamentCount = 39;
}
