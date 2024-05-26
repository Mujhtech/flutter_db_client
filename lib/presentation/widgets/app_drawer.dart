import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';

class AppDrawer {
  AppDrawer({
    required this.content,
    required this.title,
    required this.context,
  });

  final Widget content;
  final String title;
  final BuildContext context;

  void show() {
    AppDialog(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      context: context,
      begin: const Offset(0, 1),
      bgColor: Colors.transparent,
      width: context.screenWidth(0.28),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      content: CustomDrawer(
        content: content,
        title: title,
      ),
    ).show();
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({required this.content, required this.title, super.key});

  final Widget content;
  final String title;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth(0.28),
      height: context.screenHeight(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.title,
                style: context.textTheme.titleSmall,
              ),
              HyperLink(
                onTap: () => context.router.goBack(),
                child: CircleAvatar(
                  backgroundColor: context.backgroundColor,
                  radius: 20,
                  child: Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: context.iconColor,
                  ),
                ),
              ),
            ],
          ),
          const Height10(),
          Expanded(child: widget.content),
        ],
      ),
    );
  }
}
