import 'package:flutter/material.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

final localeControllerProvider =
    StateNotifierProvider<LocaleController, Locale?>((ref) {
      return LocaleController();
    });

class LocaleController extends StateNotifier<Locale?> {
  LocaleController() : super(null);

  /// Updates the selected locale. Falls back to the closest supported locale
  /// when the requested locale is not available.
  void updateLocale(String localeCode) {
    final normalized = intl.Intl.canonicalizedLocale(localeCode);
    state = _resolveLocale(normalized);
  }

  /// Clears any manual overrides so the system locale is used.
  void clearOverride() {
    state = null;
  }

  /// Resolves a locale tag (e.g., `en-US`) without mutating controller state.
  Locale? resolveLocaleFromTag(String localeTag) {
    final normalized = intl.Intl.canonicalizedLocale(localeTag);
    return _resolveLocale(normalized);
  }

  Locale? _resolveLocale(String canonicalCode) {
    final supported = AppLocalizations.supportedLocales;
    if (supported.isEmpty) {
      return null;
    }

    final parts = canonicalCode.split('_');
    final primary = parts.first;
    final region = parts.length > 1 ? parts[1] : null;

    Locale candidate;
    if (region != null && region.isNotEmpty) {
      candidate = Locale(primary, region);
    } else {
      candidate = Locale(primary);
    }

    if (supported.contains(candidate)) {
      return candidate;
    }

    final languageMatch = supported.firstWhere(
      (locale) => locale.languageCode.toLowerCase() == primary.toLowerCase(),
      orElse: () => supported.first,
    );

    return languageMatch;
  }
}
