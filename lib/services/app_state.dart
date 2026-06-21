import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/app_palettes.dart';

/// Estado global: favoritos, tema, compras/premium e tema de cores.
/// Tudo salvo localmente (privado do aparelho).
class AppState extends ChangeNotifier {
  AppState(this._prefs) {
    _load();
  }

  final SharedPreferences _prefs;

  static const _kFavorites = 'favorites';
  static const _kThemeMode = 'theme_mode';
  static const _kEntitlements = 'entitlements';
  static const _kSubscriptions = 'subscriptions';
  static const _kPalette = 'palette_id';
  static const _kTempThemes = 'temp_themes_until';
  static const _kSignature = 'custom_signature';
  static const _kTempPro = 'temp_pro_until';

  static const String pRemoveAds = 'remove_ads';
  static const String pWatermark = 'remove_watermark';
  static const String pBundle = 'premium_bundle';
  static const String pPack = 'pack_devocional';

  final Set<String> _favorites = {};
  final Set<String> _entitlements = {};
  final Set<String> _subscriptions = {};
  ThemeMode _themeMode = ThemeMode.light;
  String _paletteId = 'classico';
  DateTime? _tempThemesUntil;
  String _customSignature = '';
  DateTime? _tempProUntil;

  // ----- básico -----
  Set<String> get favorites => Set.unmodifiable(_favorites);
  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;
  bool get hasFavorites => _favorites.isNotEmpty;
  bool isFavorite(String id) => _favorites.contains(id);

  // ----- premium / compras -----
  bool get isSubscriber => _subscriptions.isNotEmpty;
  bool get hasBundle =>
      _entitlements.contains(pBundle) || isSubscriber || hasTemporaryPro;
  bool get isPremium => hasBundle;

  bool ownsProduct(String id) =>
      _entitlements.contains(id) || hasBundle;

  /// Pode ver o app sem anúncios.
  bool get adsRemoved =>
      _entitlements.contains(pRemoveAds) || hasBundle;

  /// Pode compartilhar imagens sem a marca d'água (assinatura).
  bool get canRemoveWatermark =>
      _entitlements.contains(pWatermark) || hasBundle;

  bool get hasTemporaryPro =>
      _tempProUntil != null && _tempProUntil!.isAfter(DateTime.now());
  void grantTemporaryPro(Duration d) {
    _tempProUntil = DateTime.now().add(d);
    _prefs.setInt(_kTempPro, _tempProUntil!.millisecondsSinceEpoch);
    notifyListeners();
  }

  String get customSignature => _customSignature;

  void setCustomSignature(String value) {
    _customSignature = value.trim();
    _prefs.setString(_kSignature, _customSignature);
    notifyListeners();
  }

  /// Tem acesso às categorias exclusivas (pacote, bundle ou assinatura).
  bool get ownsExclusivePack => ownsProduct(pPack);

  bool isCategoryLocked(bool premium) => premium && !ownsExclusivePack;

  // ----- temas -----
  AppPalette get palette => AppPalettes.byId(_paletteId);
  Color get accentColor => palette.accent;

  bool get hasTemporaryThemes =>
      _tempThemesUntil != null && _tempThemesUntil!.isAfter(DateTime.now());

  bool ownsPalette(String paletteId) {
    final p = AppPalettes.byId(paletteId);
    if (!p.premium) return true;
    if (hasTemporaryThemes || isPremium) return true;
    return p.productId != null && ownsProduct(p.productId!);
  }

  void _load() {
    _favorites.addAll(_prefs.getStringList(_kFavorites) ?? const []);
    final t = _prefs.getInt(_kThemeMode);
    if (t != null && t >= 0 && t < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[t];
    }
    _entitlements.addAll(_prefs.getStringList(_kEntitlements) ?? const []);
    _subscriptions.addAll(_prefs.getStringList(_kSubscriptions) ?? const []);
    _paletteId = _prefs.getString(_kPalette) ?? 'classico';
    if (!ownsPalette(_paletteId)) _paletteId = 'classico';
    final ttu = _prefs.getInt(_kTempThemes);
    _tempThemesUntil =
        ttu != null ? DateTime.fromMillisecondsSinceEpoch(ttu) : null;
    _customSignature = _prefs.getString(_kSignature) ?? '';
    final tp = _prefs.getInt(_kTempPro);
    _tempProUntil = tp != null ? DateTime.fromMillisecondsSinceEpoch(tp) : null;
  }

  void toggleFavorite(String id) {
    if (!_favorites.remove(id)) _favorites.add(id);
    _prefs.setStringList(_kFavorites, _favorites.toList());
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    _prefs.setInt(_kThemeMode, _themeMode.index);
    notifyListeners();
  }

  void grantEntitlement(String productId) {
    if (_entitlements.add(productId)) {
      _prefs.setStringList(_kEntitlements, _entitlements.toList());
      notifyListeners();
    }
  }

  void addSubscription(String productId) {
    if (_subscriptions.add(productId)) {
      _prefs.setStringList(_kSubscriptions, _subscriptions.toList());
      notifyListeners();
    }
  }

  void setPalette(String paletteId) {
    if (!ownsPalette(paletteId)) return;
    _paletteId = paletteId;
    _prefs.setString(_kPalette, paletteId);
    notifyListeners();
  }

  /// Libera todos os temas por um período (recompensa de anúncio — fase 2).
  void grantTemporaryThemes(Duration duration) {
    _tempThemesUntil = DateTime.now().add(duration);
    _prefs.setInt(_kTempThemes, _tempThemesUntil!.millisecondsSinceEpoch);
    notifyListeners();
  }
}
