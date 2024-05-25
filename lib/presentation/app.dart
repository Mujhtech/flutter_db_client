import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';

class App extends StatelessWidget {
  const App({
    required this.navigatorKey,
    super.key,
    this.themeMode,
    this.home,
    this.navigatorObservers,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final ThemeMode? themeMode;
  final Widget? home;
  final List<NavigatorObserver>? navigatorObservers;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DB Client',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
      theme: themeBuilder(ThemeData.light()),
      darkTheme: themeBuilder(ThemeData.dark()),
      themeMode: themeMode ?? ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
