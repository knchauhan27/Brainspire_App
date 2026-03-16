import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';

class BrainspireApp extends ConsumerWidget {
  const BrainspireApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Brainspire',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: false),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routerConfig: goRouter,
    );
  }
}
