import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';

class PropertiesSidebar extends StatelessWidget {
  const PropertiesSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth(0.15) > 230 ? 230 : context.screenWidth(0.15),
      child: ColoredBox(
        color: context.theme.colorScheme.surface,
        child: Column(
          children: [
            WindowTitleBarBox(child: MoveWindow()),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search for property...',
                          hintStyle: context.textTheme.bodySmall,
                          constraints: const BoxConstraints(
                            maxHeight: 30,
                          ),
                          contentPadding: const EdgeInsetsDirectional.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          border: AppInputBorder.thin.copyWith(
                            borderRadius: AppBorderRadius.md,
                          ),
                          focusedBorder: AppInputBorder.thin.copyWith(
                            borderRadius: AppBorderRadius.md,
                          ),
                          enabledBorder: AppInputBorder.thin.copyWith(
                            borderRadius: AppBorderRadius.md,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                            color: context.iconColor,
                          ),
                        ),
                      ),
                    ),
                    const Height10(),
                    Row(
                      children: [
                        Transform.rotate(
                          angle: 90 * 3.1415926535 / 180,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 10,
                            color: context.iconColor,
                          ),
                        ),
                        const Width10(),
                        Text(
                          'Properties',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const Height10(),
                    Expanded(
                      child: ListView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
