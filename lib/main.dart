import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/app_theme.dart';
import 'screens/bible_screen.dart';
import 'screens/create_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/home_screen.dart';
import 'services/app_state.dart';
import 'services/purchase_service.dart';
import 'widgets/banner_ad.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final appState = AppState(prefs);

  // Loja: ao concluir/recuperar uma compra, libera o item.
  PurchaseService.instance
    ..onEntitlement(appState.grantEntitlement)
    ..onSubscriptionGranted(appState.addSubscription)
    ..init();

  runApp(BiblicasApp(appState: appState));
}

class BiblicasApp extends StatelessWidget {
  const BiblicasApp({super.key, required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: appState,
      child: Consumer<AppState>(
        builder: (context, state, _) => MaterialApp(
          title: 'Frases Bíblicas',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(state.accentColor),
          darkTheme: AppTheme.dark(state.accentColor),
          themeMode: state.themeMode,
          home: const HomeShell(),
        ),
      ),
    );
  }
}

/// Casca com navegação inferior + espaço de anúncio.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    const pages = [
      HomeScreen(),
      BibleScreen(),
      CreateScreen(),
      FavoritesScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: IndexedStack(index: _index, children: pages)),
          const BannerPlaceholder(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Início'),
          NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book_rounded),
              label: 'Bíblia'),
          NavigationDestination(
              icon: Icon(Icons.add_circle_outline_rounded),
              selectedIcon: Icon(Icons.add_circle_rounded),
              label: 'Criar'),
          NavigationDestination(
              icon: Icon(Icons.favorite_border_rounded),
              selectedIcon: Icon(Icons.favorite_rounded),
              label: 'Favoritos'),
        ],
      ),
    );
  }
}
