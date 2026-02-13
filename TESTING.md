# Тестирование мобильного приложения

## 1. Тестовая инфраструктура

Проект использует Flutter test stack:

- `flutter_test` для unit/widget тестов
- `integration_test` для UI/E2E
- `mocktail` для моков зависимостей
- `fake_cloud_firestore` для интеграций с fake Firebase
- Drift/SQLite для локального хранилища в интеграционных тестах

Зависимости уже подключены в `mobile/flutter_app/pubspec.yaml`.

## 2. Как запускать тесты локально

Все команды запускать из `mobile/flutter_app`:

```bash
flutter pub get
flutter test
flutter test test/ui
```

Запуск конкретных групп:

```bash
# Unit + integration (каталог test/)
flutter test test

# UI / E2E (каталог test/ui)
flutter test test/ui

# Device-level integration tests (требуется Developer Mode и устройство)
flutter test integration_test -d windows
```

## 3. Отчет о запуске тестов

Для лога/отчета:

PowerShell (Windows, без device-level integration):

```powershell
New-Item -ItemType Directory -Path reports -Force | Out-Null
flutter test --machine > reports/test-report.json
flutter test test/ui --machine > reports/ui-report.json
```

Bash (macOS/Linux):

```bash
mkdir -p reports
flutter test --machine > reports/test-report.json
flutter test test/ui --machine > reports/ui-report.json
```

Что сдавать по отчету:

- Скриншот успешного запуска в терминале (где видно `All tests passed`)
- Файлы `reports/test-report.json` и `reports/ui-report.json`
- Краткий Word-отчет с пунктами:
  - дата/время запуска
  - количество пройденных тестов
  - 3 покрытых пользовательских сценария
  - ссылка на `TESTING.md`

## 4. Минимальные требования по количеству тестов

Требование задания:

- Unit: `>= 4`
- Integration: `>= 3`
- UI/E2E: `>= 3`

Реализовано в проекте:

- Unit/Widget/logic/integration в `test/`: `61` тест
- UI/E2E в `test/ui/`: `3` теста (включены в число выше)
- Device-level UI/E2E в `integration_test/`: `3` теста

## 5. Ключевые пользовательские сценарии (3+)

Покрыты следующие сценарии:

1. Онбординг пользователя: выбор языка, каналов, тихих часов, consent-флагов, проверка offline fallback.
2. Обработка конфликтов расписания: показ alert-баннера, выбор альтернативы, проверка обновления статуса и dismiss.
3. Просмотр AI-сводки: загрузка экрана, просмотр источников, действие через кнопку микрофона, offline-banner.

## 6. Набор тестов (минимум 10, с категоризацией)

### Unit tests (логика) — примеры

1. `mobile/flutter_app/test/services/personalization_engine_test.dart`  
   Проверяет маппинг confidence score в label band.

2. `mobile/flutter_app/test/domain/boundary_guard_test.dart`  
   Проверяет блокировку тем по правилам quiet hours.

3. `mobile/flutter_app/test/domain/suggestion_ranker_test.dart`  
   Проверяет ранжирование по confidence/signal score и штраф для declined.

4. `mobile/flutter_app/test/features/interaction/voice_input_controller_test.dart`  
   Проверяет состояния контроллера голоса, обработку ошибок и fallback.

### Integration tests (модули/сервисы) — примеры

1. `mobile/flutter_app/test/data/local/local_store_test.dart`  
   Проверяет запись/чтение/очистку данных в локальном хранилище (SQLite/Drift).

2. `mobile/flutter_app/test/data/context_sync_service_test.dart`  
   Проверяет синхронизацию контекста и дедупликацию уже обработанных сообщений.

3. `mobile/flutter_app/test/features/alerts/conflict_alert_controller_test.dart`  
   Проверяет работу контроллера с мокнутыми `NotificationService` и `AssistantApiClient`.

### UI / E2E tests — примеры

1. `mobile/flutter_app/test/ui/onboarding_flow_ui_test.dart`  
   Полный пользовательский flow онбординга с вводом данных и навигацией.

2. `mobile/flutter_app/test/ui/summary_updates_ui_test.dart`  
   Проверяет отображение summary, источников, сигналов и offline состояния.

3. `mobile/flutter_app/test/ui/conflict_alert_ui_test.dart`  
   Проверяет экран с конфликтом, действие по кнопке и обновление UI-статуса.

## 7. Данные, аккаунты, моки

- Реальные аккаунты не требуются.
- API в тестах замещается mock/fake реализациями (`mocktail`, `fake_cloud_firestore`).
- Для локального хранилища используются тестовые изолированные БД (без прод-данных).
- Для интеграционных тестов, требующих окружение, достаточно стандартного Flutter test runner.

## 8. Фактический результат последнего прогона

Последний прогон в этом репозитории:

- `flutter test` → `61 passed`
- `flutter test test/ui` → `3 passed`

Артефакты:

- `mobile/flutter_app/reports/test-report.json`
- `mobile/flutter_app/reports/ui-report.json`
- `mobile/flutter_app/reports/test-console.log`
- `mobile/flutter_app/reports/ui-console.log`

Примечание для `integration_test/` на Windows:

- Команда `flutter test integration_test -d windows` требует включенный Developer Mode (symlink support).  
  Если режим выключен, используйте `test/ui` как сдаваемый UI-suite и приложите отчеты из `reports/`.
