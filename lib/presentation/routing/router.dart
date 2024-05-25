import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';

class AppRouter {
  const AppRouter(this._context);

  final BuildContext _context;

  void goBack() => Navigator.of(_context).pop();

  Future<void> goToHome() =>
      _goToAndRemoveUntil((_) => const HomeScreen(), AppRoutes.home);

  Future<void> goToDashboard() =>
      _goToAndRemoveUntil((_) => const DashboardScreen(), AppRoutes.dashboard);

  Future<T?> _goTo<T>(WidgetBuilder builder, String name) =>
      Navigator.of(_context).push<T>(
        MaterialPageRoute<T>(
          builder: (_) => builder(_),
          settings: RouteSettings(name: name),
        ),
      );

  Future<T?> _goToAndRemoveUntil<T>(
    WidgetBuilder builder,
    String name, {
    bool predicate = false,
  }) =>
      Navigator.of(_context).pushAndRemoveUntil<T?>(
        MaterialPageRoute<T?>(
          builder: (_) => builder(_),
          settings: RouteSettings(name: name),
        ),
        (Route<dynamic> route) => predicate,
      );
}
