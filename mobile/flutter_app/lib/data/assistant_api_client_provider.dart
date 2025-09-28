import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assistantApiClientProvider = Provider.autoDispose<AssistantApiClient>((
  ref,
) {
  final config = ref.watch(appConfigProvider);
  final client = AssistantApiClient(baseUrl: config.mockApiBaseUrl);
  ref.onDispose(client.close);
  return client;
});
