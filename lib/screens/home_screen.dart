import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/app_theme.dart';
import '../data/devotional_generator.dart';
import '../data/models.dart';
import '../data/verses.dart';
import '../services/app_state.dart';
import '../widgets/share_helper.dart';
import 'category_screen.dart';
import 'devotional_screen.dart';
import 'store_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final free = VerseData.freeVerses;
    final today = DateTime.now().difference(DateTime(2020)).inDays;
    final daily = free[today % free.length];

    return Scaffold(
      appBar: AppBar(
        title: const Text('📖  Frases Bíblicas'),
        actions: [
          IconButton(
            tooltip: 'Loja Premium',
            icon: Icon(Icons.workspace_premium_rounded,
                color: state.isPremium ? const Color(0xFFD9A406) : null),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const StoreScreen()),
            ),
          ),
          IconButton(
            tooltip: 'Tema',
            icon: Icon(state.isDark
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded),
            onPressed: () => context.read<AppState>().toggleTheme(),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: _DailyCard(verse: daily),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 6, 16, 8),
            child: _DevotionalCard(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
            child: Text('Categorias',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.15,
            children: [
              for (final c in VerseData.categories)
                _CategoryTile(
                    category: c, locked: state.isCategoryLocked(c.premium)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DailyCard extends StatelessWidget {
  const _DailyCard({required this.verse});
  final Verse verse;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final fav = state.isFavorite(verse.id);
    final grad = state.palette.gradient;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 20, 12, 8),
      decoration: BoxDecoration(
        gradient: AppTheme.gradient(grad),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: grad.last.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded,
                  color: AppTheme.gold, size: 16),
              const SizedBox(width: 6),
              Text('VERSÍCULO DO DIA',
                  style: TextStyle(
                    color: AppTheme.gold,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    fontSize: 12,
                  )),
            ],
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(verse.text,
                style: GoogleFonts.lora(
                  color: Colors.white,
                  fontSize: 19,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const SizedBox(height: 10),
          Text('— ${verse.reference}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              )),
          Row(
            children: [
              IconButton(
                icon: Icon(
                    fav ? Icons.favorite : Icons.favorite_border_rounded,
                    color: Colors.white),
                onPressed: () =>
                    context.read<AppState>().toggleFavorite(verse.id),
              ),
              IconButton(
                icon: const Icon(Icons.copy_rounded, color: Colors.white),
                onPressed: () async {
                  await ShareHelper.copy(verse.shareText);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Versículo copiado!')),
                    );
                  }
                },
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.share_rounded, color: Colors.white),
                onPressed: () => ShareHelper.share(verse.shareText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DevotionalCard extends StatelessWidget {
  const _DevotionalCard();

  @override
  Widget build(BuildContext context) {
    final text = DevotionalGenerator.ofDay();
    final scheme = Theme.of(context).colorScheme;
    final share = '$text\n\n📖 Frases Bíblicas';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 14, 8, 4),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.onSurface.withValues(alpha: 0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.wb_sunny_rounded,
                  color: Color(0xFFD4AF37), size: 16),
              const SizedBox(width: 6),
              Text('DEVOCIONAL DO DIA',
                  style: TextStyle(
                      color: scheme.primary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                      fontSize: 12)),
            ],
          ),
          const SizedBox(height: 10),
          Text(text, style: GoogleFonts.lora(fontSize: 15.5, height: 1.5)),
          Row(
            children: [
              TextButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DevotionalScreen()),
                ),
                icon: const Icon(Icons.menu_book_rounded, size: 18),
                label: const Text('Ver mais'),
              ),
              const Spacer(),
              IconButton(
                tooltip: 'Copiar',
                icon: const Icon(Icons.copy_rounded, size: 20),
                onPressed: () async {
                  await ShareHelper.copy(share);
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
                onPressed: () => ShareHelper.share(share),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.category, this.locked = false});
  final VerseCategory category;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(22),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppTheme.gradient(category.gradient),
          borderRadius: BorderRadius.circular(22),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  locked ? const StoreScreen() : CategoryScreen(category: category),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(category.emoji, style: const TextStyle(fontSize: 30)),
                    const Spacer(),
                    if (locked)
                      const Icon(Icons.lock_rounded,
                          color: Colors.white, size: 20),
                  ],
                ),
                const Spacer(),
                Text(category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(height: 4),
                Text(locked ? 'Exclusivo' : '${category.verses.length} versículos',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
