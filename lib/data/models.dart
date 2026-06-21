import 'package:flutter/material.dart';

import 'app_info.dart';

/// Um versículo bíblico (texto + referência, ex.: "João 3:16").
class Verse {
  const Verse(this.text, this.reference);

  final String text;
  final String reference;

  String get id => '$reference::${text.hashCode}';

  /// Texto pronto pra compartilhar (assinatura + link do app = tráfego orgânico).
  String get shareText =>
      '"$text"\n— $reference\n\n📖 ${AppInfo.appName}\n${AppInfo.shareFooter}';
}

/// Categoria de versículos (ex.: Fé, Esperança, Amor...).
class VerseCategory {
  const VerseCategory({
    required this.id,
    required this.name,
    required this.emoji,
    required this.gradient,
    required this.verses,
    this.premium = false,
  });

  final String id;
  final String name;
  final String emoji;
  final List<Color> gradient;
  final List<Verse> verses;

  /// Categoria exclusiva: só liberada com o pacote premium / assinatura.
  final bool premium;
}
