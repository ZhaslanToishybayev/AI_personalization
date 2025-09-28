import 'dart:convert';

import 'package:flutter_app/domain/assistive_suggestion.dart';
import 'package:flutter_app/domain/interaction_session.dart';
import 'package:http/http.dart' as http;

class AssistantApiClient {
  AssistantApiClient({required this.baseUrl, http.Client? httpClient})
    : _client = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client _client;

  Future<SessionResponse> openSession({
    required InteractionChannel channel,
    required String locale,
    List<String>? contextOverrides,
    Map<String, bool>? clientCapabilities,
    String? bearerToken,
    String? serviceToken,
  }) async {
    final uri = Uri.parse('$baseUrl/assistant/session');
    final headers = _buildHeaders(
      bearerToken: bearerToken,
      serviceToken: serviceToken,
    );
    final response = await _client.post(
      uri,
      headers: headers,
      body: jsonEncode({
        'channel': channel.name,
        'locale': locale,
        if (contextOverrides != null && contextOverrides.isNotEmpty)
          'context_overrides': contextOverrides,
        if (clientCapabilities != null && clientCapabilities.isNotEmpty)
          'client_capabilities': clientCapabilities,
      }),
    );

    _ensureSuccess(response);
    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    return SessionResponse.fromJson(payload);
  }

  Future<SuggestionsResponse> listSuggestions({
    String? cursor,
    int? maxResults,
    String? filter,
    String? bearerToken,
    String? serviceToken,
    String? acceptLanguage,
  }) async {
    final query = <String, String>{
      if (cursor != null) 'cursor': cursor,
      if (maxResults != null) 'max_results': '$maxResults',
      if (filter != null) 'filter': filter,
    };

    final uri = Uri.parse(
      '$baseUrl/assistant/suggestions',
    ).replace(queryParameters: query.isEmpty ? null : query);

    final response = await _client.get(
      uri,
      headers: _buildHeaders(
        bearerToken: bearerToken,
        serviceToken: serviceToken,
        acceptLanguage: acceptLanguage,
      ),
    );
    _ensureSuccess(response);

    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    return SuggestionsResponse.fromJson(payload);
  }

  Future<void> sendFeedback({
    required String suggestionId,
    required String status,
    String? note,
    bool? quietHoursOverride,
    String? bearerToken,
    String? serviceToken,
  }) async {
    final uri = Uri.parse('$baseUrl/assistant/feedback');
    final response = await _client.post(
      uri,
      headers: _buildHeaders(
        bearerToken: bearerToken,
        serviceToken: serviceToken,
      ),
      body: jsonEncode({
        'suggestion_id': suggestionId,
        'status': status,
        if (note != null && note.isNotEmpty) 'note': note,
        if (quietHoursOverride != null)
          'quiet_hours_override': quietHoursOverride,
      }),
    );
    _ensureSuccess(response, expectedCode: 204);
  }

  Future<void> ingestCalendarEvents({
    required String userId,
    required List<Map<String, dynamic>> events,
    String? syncToken,
    List<String>? deletedEventIds,
    String? serviceToken,
  }) async {
    final uri = Uri.parse('$baseUrl/context/calendar');
    final response = await _client.post(
      uri,
      headers: _buildHeaders(serviceToken: serviceToken),
      body: jsonEncode({
        'user_id': userId,
        'events': events,
        if (syncToken != null) 'sync_token': syncToken,
        if (deletedEventIds != null && deletedEventIds.isNotEmpty)
          'deleted_event_ids': deletedEventIds,
      }),
    );
    _ensureSuccess(response, expectedCode: 202);
  }

  Future<void> registerDevice({
    required String deviceId,
    required String platform,
    required String pushToken,
    Map<String, dynamic>? quietHours,
    String? locale,
    String? serviceToken,
  }) async {
    final uri = Uri.parse('$baseUrl/notifications/devices');
    final response = await _client.put(
      uri,
      headers: _buildHeaders(serviceToken: serviceToken),
      body: jsonEncode({
        'device_id': deviceId,
        'platform': platform,
        'push_token': pushToken,
        if (locale != null) 'locale': locale,
        if (quietHours != null) 'quiet_hours': quietHours,
      }),
    );
    _ensureSuccess(response, expectedCode: 204);
  }

  Future<void> ingestGmailMessages({
    required String userId,
    required List<Map<String, dynamic>> messages,
    String? syncToken,
    String? serviceToken,
  }) async {
    final uri = Uri.parse('$baseUrl/context/gmail');
    final response = await _client.post(
      uri,
      headers: _buildHeaders(serviceToken: serviceToken),
      body: jsonEncode({
        'user_id': userId,
        'messages': messages,
        if (syncToken != null) 'sync_token': syncToken,
      }),
    );
    _ensureSuccess(response, expectedCode: 202);
  }

  Future<void> enqueueAlert({
    required String userId,
    required String priority,
    required String title,
    required String body,
    String? suggestionId,
    bool? quietHoursOverride,
    DateTime? expiresAt,
    String? serviceToken,
  }) async {
    final uri = Uri.parse('$baseUrl/notifications/alerts');
    final response = await _client.post(
      uri,
      headers: _buildHeaders(serviceToken: serviceToken),
      body: jsonEncode({
        'user_id': userId,
        'priority': priority,
        'title': title,
        'body': body,
        if (suggestionId != null) 'suggestion_id': suggestionId,
        if (quietHoursOverride != null)
          'quiet_hours_override': quietHoursOverride,
        if (expiresAt != null) 'expires_at': expiresAt.toIso8601String(),
      }),
    );
    _ensureSuccess(response, expectedCode: 202);
  }

  void close() => _client.close();

  void _ensureSuccess(http.Response response, {int expectedCode = 200}) {
    if (response.statusCode != expectedCode) {
      throw AssistantApiException(
        statusCode: response.statusCode,
        body: response.body,
      );
    }
  }

  Map<String, String> _buildHeaders({
    String? bearerToken,
    String? serviceToken,
    String? acceptLanguage,
  }) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (bearerToken != null) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }
    if (serviceToken != null) {
      headers['X-Service-Token'] = serviceToken;
    }
    if (acceptLanguage != null) {
      headers['Accept-Language'] = acceptLanguage;
    }
    return headers;
  }
}

class AssistantApiException implements Exception {
  AssistantApiException({required this.statusCode, required this.body});

  final int statusCode;
  final String body;

  @override
  String toString() =>
      'AssistantApiException(statusCode: $statusCode, body: $body)';
}

class SessionResponse {
  SessionResponse({
    required this.sessionId,
    required this.expiresAt,
    this.warmupSummary,
    this.personalizationState,
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    return SessionResponse(
      sessionId: json['session_id'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      warmupSummary: json['warmup_summary'] as String?,
      personalizationState: json['personalization_state'] == null
          ? null
          : PersonalizationState.fromJson(
              Map<String, dynamic>.from(json['personalization_state'] as Map),
            ),
    );
  }

  final String sessionId;
  final DateTime expiresAt;
  final String? warmupSummary;
  final PersonalizationState? personalizationState;
}

class PersonalizationState {
  PersonalizationState({
    required this.upcomingConflicts,
    required this.quietHoursActive,
    this.dailyFocusTheme,
  });

  factory PersonalizationState.fromJson(Map<String, dynamic> json) {
    return PersonalizationState(
      dailyFocusTheme: json['daily_focus_theme'] as String?,
      upcomingConflicts: json['upcoming_conflicts'] as int? ?? 0,
      quietHoursActive: json['quiet_hours_active'] as bool? ?? false,
    );
  }

  final String? dailyFocusTheme;
  final int upcomingConflicts;
  final bool quietHoursActive;
}

class SuggestionsResponse {
  SuggestionsResponse({required this.suggestions});

  factory SuggestionsResponse.fromJson(Map<String, dynamic> json) {
    final entries = json['suggestions'] as List<dynamic>? ?? const [];
    return SuggestionsResponse(
      suggestions: entries
          .map(
            (item) => AssistiveSuggestion.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(),
    );
  }

  final List<AssistiveSuggestion> suggestions;
}
