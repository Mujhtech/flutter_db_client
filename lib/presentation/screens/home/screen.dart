import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';
import 'package:flutter_db_client/presentation/screens/home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: context.theme.colorScheme.surface,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(
                    size: 50,
                  ),
                  Text(
                    'Welcome to Flutter DB Client',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: AppFontWeight.bold,
                      fontFamily: kDefaultHeaderFontFamily,
                    ),
                  ),
                  Text(
                    'v1.0.0',
                    style: context.textTheme.bodySmall!.copyWith(

                        //fontFamily: kDefaultHeaderFontFamily,
                        ),
                  ),
                  const Height15(),
                  SizedBox(
                    width: context.screenWidth(0.5),
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search for connection',
                        hintStyle: context.textTheme.bodySmall,
                        contentPadding: const EdgeInsetsDirectional.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        border: AppInputBorder.thin,
                        focusedBorder: AppInputBorder.thin,
                        enabledBorder: AppInputBorder.thin,
                        //fillColor: Colors.transparent,
                        //hoverColor: Colors.transparent,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: context.iconColor,
                        ),
                        suffixIcon: HyperLink(
                          onTap: () {
                            AppDialog(
                              padding: const EdgeInsets.all(10),
                              content: const CreateConnectionDialog(),
                              context: context,
                              width: 500,
                            ).show();
                          },
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: context.iconColor,
                          ),
                        ),
                      ),
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
