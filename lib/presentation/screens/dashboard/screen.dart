import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';
import 'package:flutter_db_client/presentation/screens/dashboard/widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: context.theme.colorScheme.surface,
        child: Row(
          children: [
            const Sidebar(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Navbar(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'data',
                                      style: context.textTheme.headlineLarge,
                                    ),
                                  ],
                                ),
                              ),
                              const SqlConsole(),
                            ],
                          ),
                        ),
                        const PropertiesSidebar(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
