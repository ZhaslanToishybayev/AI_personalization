import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_app/domain/assistive_suggestion.dart';
import 'package:flutter_app/domain/interaction_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Сервис для получения реальных AI предложений от сервера
class SuggestionService {
  SuggestionService(this._apiClient, this._config);

  final AssistantApiClient _apiClient;
  final AppConfig _config;

  /// Создает сессию с AI ассистентом
  Future<SessionResponse> createSession({
    required InteractionChannel channel,
    String locale = 'ru',
  }) async {
    try {
      return await _apiClient.openSession(
        channel: channel,
        locale: locale,
        bearerToken: _config.serviceAuthToken,
      );
    } catch (e) {
      throw Exception('Failed to create AI session: $e');
    }
  }

  /// Получает список AI предложений
  Future<List<AssistiveSuggestion>> getSuggestions({
    String? filter,
    int? maxResults,
  }) async {
    try {
      final response = await _apiClient.listSuggestions(
        bearerToken: _config.serviceAuthToken,
        filter: filter,
        maxResults: maxResults,
      );
      
      // Конвертируем ответ в Suggestions объекты
      final suggestions = response.suggestions.map((suggestion) {
        return AssistiveSuggestion(
          id: suggestion.id,
          userId: 'demo-user', // Будет заменено на реальный user id
          triggerContextIds: ['mock-session'], // Будет заменено на реальные
          generatedAt: DateTime.now(),
          type: suggestion.type,
          message: suggestion.message,
          explanation: _createMockExplanation(), // Временно, пока API не возвращает правильный формат
          confidenceScore: suggestion.confidenceScore ?? 0.7,
          status: suggestion.status,
        );
      }).toList();

      return suggestions;
    } catch (e) {
      throw Exception('Failed to fetch suggestions: $e');
    }
  }

  /// Отправляет обратную связь по предложению
  Future<void> sendFeedback({
    required String suggestionId,
    required String status,
    String? note,
  }) async {
    try {
      await _apiClient.sendFeedback(
        suggestionId: suggestionId,
        status: status,
        note: note,
        bearerToken: _config.serviceAuthToken,
      );
    } catch (e) {
      throw Exception('Failed to send feedback: $e');
    }
  }

  SuggestionExplanation _createMockExplanation() {
    // Временно создаем мок объяснение пока API не возвращает правильный формат
    return const SuggestionExplanation(
      sources: [
        ExplanationSource(
          signalId: 'mock-signal',
          summary: 'AI recommendation based on current context',
        ),
      ],
      rationale: 'AI analyzed your calendar and patterns to provide personalized suggestions',
      confidenceBand: ConfidenceBand.medium,
      nextSteps: ['Review suggestion', 'Take action', 'Provide feedback'],
    );
  }
}

/// Provider для SuggestionService
final suggestionServiceProvider = Provider<SuggestionService>((ref) {
  final apiClient = ref.watch(assistantApiClientProvider);
  final config = ref.watch(appConfigProvider);
  
  return SuggestionService(apiClient, config);
});

/// Provider для асинхронного получения предложений
final suggestionsProvider = FutureProvider<List<AssistiveSuggestion>>((ref) async {
  final suggestionService = ref.watch(suggestionServiceProvider);
  
  return suggestionService.getSuggestions();
});

/// Provider для сессии AI
final aiSessionProvider = FutureProvider<SessionResponse>((ref) async {
  final suggestionService = ref.watch(suggestionServiceProvider);
  
  return suggestionService.createSession(channel: InteractionChannel.text);
});
