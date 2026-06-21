import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/devotional_generator.dart';
import '../widgets/share_helper.dart';

/// Lista "infinita" de devocionais gerados no app (sem IA, sem internet).
class DevotionalScreen extends StatelessWidget {
  const DevotionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('📿  Devocionais')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: DevotionalGenerator.total,
        itemBuilder: (context, i) {
          // Espalha a ordem para itens vizinhos não ficarem parecidos.
          final text = DevotionalGenerator.byIndex(i * 7919);
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 6, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,
                      style: GoogleFonts.lora(fontSize: 16, height: 1.5)),
                  Row(
                    children: [
                      Text('Devocional #${i + 1}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: scheme.primary)),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Copiar',
                        icon: const Icon(Icons.copy_rounded, size: 20),
                        onPressed: () async {
                          await ShareHelper.copy('$text\n\n📖 Frases Bíblicas');
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Copiado!')),
                            );
                          }
                        },
                      ),
                      IconButton(
                        tooltip: 'Compartilhar',
                        icon: const Icon(Icons.share_rounded, size: 20),
                        onPressed: () => ShareHelper.share(
                            '$text\n\n📖 Frases Bíblicas'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
