import 'dart:async';
import 'package:flutter/material.dart';
import 'package:drift/native.dart';
import 'package:flutter_app/data/local/local_store.dart';
import 'package:flutter_app/domain/assistive_suggestion.dart';
import 'package:flutter_app/domain/context_signal.dart';
import 'package:flutter_app/services/suggestion_service.dart';
import 'package:flutter_app/theme/widgets/simple_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Simple Material Design Home Screen
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appConfigProvider);
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _taskCompleted = [false, false];
  int _suggestionCount = 0;
  final LocalStore _localStore = LocalStore();
  late Future<List<AssistiveSuggestion>> _suggestionsFuture;
  late Future<List<ContextSignal>> _contextSignalsFuture;
  
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      // Инициализируем in-memory базу данных для демонстрации
      final db = DatabaseConnection(NativeDatabase.memory());
      _localStore = LocalStore.withConnection(db);
      
      // Создаем демо данные
      await _createDemoData();
      
      // Загружаем данные из базы
      setState(() {
        _suggestionsFuture = _localStore.pendingSuggestions('demo-user');
        _contextSignalsFuture = _localStore.activeContextSignals('demo-user');
      });
    } catch (e) {
      print('Error initializing database: $e');
      // Если база данных не работает, покажем простой экран
      setState(() {
        _suggestionsFuture = Future.value([]);
        _contextSignalsFuture = Future.value([]);
      });
    }
  }

  Future<void> _createDemoData() async {
    final now = DateTime.now();
    
    // Создаем demo контекстные сигналы (календарь события)
    final demoSignals = [
      ContextSignal(
        id: 'signal-1',
        userId: 'demo-user',
        source: ContextSource.calendar,
        sourceIdentifier: 'calendar-1',
        ingestedAt: now,
        priority: SignalPriority.high,
        expiresAt: now.add(const Duration(days: 1)),
        permissionsScope: 'calendar.read',
        payloadDigest: 'digest-1',
      ),
      ContextSignal(
        id: 'signal-2', 
        userId: 'demo-user',
        source: ContextSource.calendar,
        sourceIdentifier: 'calendar-2',
        ingestedAt: now,
        priority: SignalPriority.high,
        expiresAt: now.add(const Duration(days: 1)),
        permissionsScope: 'calendar.read',
        payloadDigest: 'digest-2',
      ),
    ];
    
    // Создаем demo предложения
    final demoSuggestions = [
      AssistiveSuggestion(
        id: 'suggestion-1',
        userId: 'demo-user',
        triggerContextIds: ['signal-1'],
        generatedAt: now,
        type: SuggestionType.reminder,
        message: 'Подготовиться к встрече с командой',
        explanation: SuggestionExplanation(
          sources: [
            const ExplanationSource(
              signalId: '1',
              summary: 'Team meeting preparation needed',
            ),
          ],
          rationale: 'Важная встреча требует подготовки',
          confidenceBand: ConfidenceBand.high,
          nextSteps: ['Открыть повестку', 'Подготовить вопросы'],
        ),
        confidenceScore: 0.92,
        status: SuggestionStatus.pending,
      ),
      AssistiveSuggestion(
        id: 'suggestion-2',
        userId: 'demo-user',
        triggerContextIds: ['signal-2'],
        generatedAt: now,
        type: SuggestionType.dailyPlan,
        message: 'Запланировать перерыв на обед',
        explanation: SuggestionExplanation(
          sources: [
            const ExplanationSource(
              signalId: '2',
              summary: 'Take lunch break needed',
            ),
          ],
          rationale: 'Длительная работа без перерыва снижает продуктивность',
          confidenceBand: ConfidenceBand.medium,
          nextSteps: ['Забронировать время', 'Выбрать место для обеда'],
        ),
        confidenceScore: 0.87,
        status: SuggestionStatus.pending,
      ),
    ];
    
    // Сохраняем в базу
    await _localStore.upsertContextSignals(demoSignals);
    await _localStore.upsertSuggestions(demoSuggestions);
  }

  Widget _buildSuggestionCard(AssistiveSuggestion suggestion) {
  return SimpleCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getIconForSuggestion(suggestion.type),
                color: Theme.of(context).colorScheme.secondary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suggestion.message,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Confidence: ${(suggestion.confidenceScore * 100).toStringAsFixed(0)}%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () => _showSnackBar('ℹ️ ${suggestion.explanation.rationale}'),
                  child: const Text('Info'),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () => _acceptSuggestion(suggestion),
                  child: const Text('Accept'),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () => _declineSuggestion(suggestion),
                  child: const Text('Decline'),
                ),
              ],
            ),
          ],
        ),
        if (suggestion.explanation.nextSteps.isNotEmpty) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Next steps:',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...suggestion.explanation.nextSteps.map(
                  (step) => Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '• $step',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    ),
  );
}

IconData _getIconForSuggestion(SuggestionType type) {
  switch (type) {
    case SuggestionType.reminder:
      return Icons.notifications_active;
    case SuggestionType.dailyPlan:
      return Icons.schedule;
    case SuggestionType.alert:
      return Icons.warning;
    case SuggestionType.automation:
      return Icons.auto_awesome;
    case SuggestionType.summary:
      return Icons.summarize;
  }
}

Future<void> _acceptSuggestion(AssistiveSuggestion suggestion) async {
  // Обновляем статус в базе данных
  final updatedSuggestion = suggestion.copyWith(
    status: SuggestionStatus.accepted,
    respondedAt: DateTime.now(),
  );
  
  await _localStore.upsertSuggestions([updatedSuggestion]);
  
  // Обновляем UI
  setState(() {
    _suggestionsFuture = _localStore.pendingSuggestions('demo-user');
  });
  
  _showSnackBar('✅ Принято: ${suggestion.message}');
}

Future<void> _declineSuggestion(AssistiveSuggestion suggestion) async {
  // Обновляем статус в базе данных
  final updatedSuggestion = suggestion.copyWith(
    status: SuggestionStatus.declined,
    respondedAt: DateTime.now(),
  );
  
  await _localStore.upsertSuggestions([updatedSuggestion]);
  
  // Обновляем UI
  setState(() {
    _suggestionsFuture = _localStore.pendingSuggestions('demo-user');
  });
  
  _showSnackBar('❌ Отклонено: ${suggestion.message}');
}

@override
Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal AI'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notifications',
            onPressed: () => _showSnackBar('🔔 Все уведомления в порядке!'),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () => _showSnackBar('⚙️ Настройки временно отключены'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // Greeting Card
          SimpleCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.wb_sunny_outlined,
                        color: theme.colorScheme.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning',
                            style: textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Let\'s make today productive',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Section: Today's Agenda
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Today\'s Agenda',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),

          // Agenda Items
          SimpleCard(
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '9:00 AM - Team Meeting',
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Conference Room A',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'More options',
                  onPressed: () {},
                ),
              ],
            ),
          ),

          SimpleCard(
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2:00 PM - Client Call',
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Video Conference',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'More options',
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Section: AI Suggestions
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: 20,
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'AI Suggestions',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),

          FutureBuilder<List<AssistiveSuggestion>>(
            future: _suggestionsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SimpleCard(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              
              if (snapshot.hasError) {
                return SimpleCard(
                  child: Text('Error loading suggestions: ${snapshot.error}'),
                );
              }
              
              final suggestions = snapshot.data ?? [];
              
              if (suggestions.isEmpty) {
                return const SimpleCard(
                  child: Text('No suggestions available at the moment.'),
                );
              }
              
              return Column(
                children: suggestions.map((suggestion) => _buildSuggestionCard(suggestion)).toList(),
              );
            },
          ),

          // Section: Focus Tasks
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Focus Tasks',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),

          SimpleCard(
            child: Row(
              children: [
                Semantics(
                  label: 'Mark "Review Q4 Report" as complete',
                  child: Checkbox(
                    value: _taskCompleted[0],
                    onChanged: (value) {
                      setState(() {
                        _taskCompleted[0] = value ?? false;
                      });
                      if (value == true) {
                        _showSnackBar('✅ Задача "Review Q4 Report" выполнена!');
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Review Q4 Report',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),

          SimpleCard(
            child: Row(
              children: [
                Semantics(
                  label: 'Mark "Update Project Timeline" as complete',
                  child: Checkbox(
                    value: _taskCompleted[1],
                    onChanged: (value) {
                      setState(() {
                        _taskCompleted[1] = value ?? false;
                      });
                      if (value == true) {
                        _showSnackBar('✅ Задача "Update Project Timeline" выполнена!');
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Update Project Timeline',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _suggestionCount++;
          });
          _showSnackBar('🤖 AI Предложение #$_suggestionCount: Время сделать перерыв!');
        },
        child: const Icon(Icons.mic), //_voice input prompt_
      ),
    );
  }
}
