// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod
import 'config/routes/app_route.dart';
import 'config/theme/app_theme.dart';

void main() {
  // ProviderScope - Riverpod ishlashi uchun shart
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Routerni olamiz
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Bolajon Ta\'minoti',
      theme: AppTheme.lightTheme,

      // GoRouter sozlamalari
      routerConfig: router,
    );
  }
}
