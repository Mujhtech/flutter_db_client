import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NavigatorObserver navigationObserver = NavigatorObserver();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  runApp(
    ProviderScope(
      overrides: const <Override>[],
      child: App(
        navigatorKey: navigatorKey,
        navigatorObservers: <NavigatorObserver>[navigationObserver],
      ),
    ),
  );

  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

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
      home: const MyHomePage(title: 'Flutter DB Client'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
