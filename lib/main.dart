import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_client/core/core.dart';
import 'package:flutter_db_client/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NavigatorObserver navigationObserver = NavigatorObserver();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final DeviceInformation deviceInformation =
      await AppDeviceInformation.initialize();

  runApp(
    ProviderScope(
      overrides: <Override>[
        appDeviceInfoProvider.overrideWithValue(deviceInformation),
      ],
      child: App(
        navigatorKey: navigatorKey,
        navigatorObservers: <NavigatorObserver>[navigationObserver],
      ),
    ),
  );

  doWhenWindowReady(() {
    const initialSize = Size(650, 500);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
