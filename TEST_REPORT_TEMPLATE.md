# Шаблон отчета для Word

## Тема
Реализация автоматических тестов мобильного приложения Personal AI Assistant

## Дата и время запуска
- Дата: `____`
- Время: `____`
- Среда: Flutter `____`, OS `____`

## Выполненные команды
```bash
flutter test
flutter test test/ui
```

## Результаты
- Unit/Integration (`test/`): `____ passed`
- UI/E2E (`test/ui/`): `____ passed`
- Итого: `____ passed`

Приложить:
- Скрин терминала с успешным прогоном
- Логи `reports/test-report.json` и `reports/ui-report.json`
- Консольные логи `reports/test-console.log` и `reports/ui-console.log`

Команда для подготовки папки `reports` (PowerShell):

```powershell
New-Item -ItemType Directory -Path reports -Force | Out-Null
```

## Покрытые ключевые пользовательские сценарии
1. Онбординг (ввод данных + переходы по шагам + offline fallback).
2. Обработка конфликтов расписания (alert + альтернативы + обновление статуса).
3. Экран summary (источники, сигналы, voice action, offline banner).

## Краткий список тестов
- Unit: `boundary_guard_test.dart`, `suggestion_ranker_test.dart`, `voice_input_controller_test.dart`, `personalization_engine_test.dart`.
- Integration: `local_store_test.dart`, `context_sync_service_test.dart`, `conflict_alert_controller_test.dart`.
- UI/E2E: `onboarding_flow_test.dart`, `summary_updates_test.dart`, `conflict_alert_test.dart`.
- UI/E2E: `onboarding_flow_ui_test.dart`, `summary_updates_ui_test.dart`, `conflict_alert_ui_test.dart`.

## Примечание для integration_test
Device-level запуск `integration_test/` на Windows требует включенный Developer Mode (symlink support).

## Ссылка на инструкцию
См. `TESTING.md`.
