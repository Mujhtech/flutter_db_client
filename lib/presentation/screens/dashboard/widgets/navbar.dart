import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';
import 'package:icons_plus/icons_plus.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ColoredBox(
        color: context.theme.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              HyperLink(
                child: const Icon(
                  Icons.circle_notifications_outlined,
                  size: 18,
                ),
                onTap: () {},
              ),
              const Width10(),
              HyperLink(
                child: const Icon(
                  Icons.circle_notifications_outlined,
                  size: 18,
                ),
                onTap: () {},
              ),
              const Width10(),
              HyperLink(
                child: const Icon(
                  Icons.refresh_outlined,
                  size: 18,
                ),
                onTap: () {},
              ),
              const Width20(),
              Expanded(
                child: HyperLink(
                  onTap: () {},
                  child: Container(
                    height: 25,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.8),
                      borderRadius: AppBorderRadius.md,
                    ),
                    child: Text(
                      'Swerv Sandbox : core_db_sandbox : MySql (Production)',
                      style: context.textTheme.bodySmall!
                          .copyWith(fontFamily: kDefaultHeaderFontFamily),
                    ),
                  ),
                ),
              ),
              const Width20(),
              HyperLink(
                child: const Icon(
                  Icons.circle_notifications_outlined,
                  size: 18,
                ),
                onTap: () {},
              ),
              const Width10(),
              HyperLink(
                child: const Icon(
                  AntDesign.reload_outline,
                  size: 18,
                ),
                onTap: () {},
              ),
              const Width10(),
              HyperLink(
                child: const Icon(
                  Icons.refresh_outlined,
                  size: 18,
                ),
                onTap: () {},
              ),
              const Width10(),
              HyperLink(
                child: const Icon(
                  Icons.refresh_outlined,
                  size: 18,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
