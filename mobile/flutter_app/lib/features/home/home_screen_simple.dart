import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/home_screen.dart';

/// Backward-compatible entry screen used by `main.dart`.
///
/// The detailed UI and state are hosted in [HomeShellScreen].
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const HomeShellScreen();
}
