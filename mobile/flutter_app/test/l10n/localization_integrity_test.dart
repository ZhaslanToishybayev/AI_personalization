import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final arbDir = Directory('lib/l10n/arb');
  final baseFile = File('${arbDir.path}/app_en.arb');
  final baseData =
      json.decode(baseFile.readAsStringSync()) as Map<String, dynamic>;
  final baseKeys = baseData.keys
      .where((key) => !key.startsWith('@@') && !key.startsWith('@'))
      .toSet();

  final localeFiles = arbDir
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.arb'))
      .where((file) => file.path != baseFile.path);

  for (final file in localeFiles) {
    test(
      'Locale file ${file.uri.pathSegments.last} contains all base translations',
      () {
        final localeData =
            json.decode(file.readAsStringSync()) as Map<String, dynamic>;
        for (final key in baseKeys) {
          expect(
            localeData.containsKey(key),
            isTrue,
            reason: 'Missing key "$key" in ${file.path}',
          );
          final value = localeData[key];
          expect(
            value,
            isA<String>(),
            reason: 'Value for "$key" must be a string in ${file.path}',
          );
          expect(
            (value as String).trim(),
            isNotEmpty,
            reason: 'Value for "$key" is empty in ${file.path}',
          );
        }
      },
    );
  }
}
