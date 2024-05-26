import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dark.dart';

class SqlConsole extends StatelessWidget {
  const SqlConsole({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
SELECT * FROM users;

SELECT * FROM users WHERE id = 1;

SELECT * FROM users WHERE id = 1 AND name = 'John Doe';

SELECT * FROM users WHERE id = 1 OR name = 'John Doe';


SELECT * FROM users WHERE id = 1 AND name = 'John Doe' OR email = '

- SQL Injection
SELECT * FROM users WHERE id = 1 AND (name = 'John Doe' OR email = '
''';

    return SizedBox(
      height: context.screenHeight(0.3),
      width: context.screenWidth(),
      child: HighlightView(
        // The original code to be highlighted
        code,

        // Specify language
        // It is recommended to give it a value for performance
        language: 'sql',

        // Specify highlight theme
        // All available themes are listed in `themes` folder
        theme: darkTheme,

        // Specify padding
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

        // Specify text style
        textStyle: context.textTheme.bodySmall!.copyWith(
          fontFamily: kDefaultHeaderFontFamily,
        ),
      ),
    );
  }
}
