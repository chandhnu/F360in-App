import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/routes.dart';
import 'config/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('F360in Dashboard Prototype Starting...');
  runApp(const ProviderScope(child: F360inApp()));
}

class F360inApp extends ConsumerWidget {
  const F360inApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'F360in - Dashboard Prototype',
      theme: AppTheme.darkTheme(),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
