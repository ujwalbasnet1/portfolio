import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helper/ui_helpers.dart';

import 'modules/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.dark();
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: theme.copyWith(
        primaryColor: kcPrimaryColor,
        buttonColor: kcPrimaryColor,
        buttonTheme: ButtonThemeData(
          buttonColor: kcPrimaryColor,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      home: HomePage(),
    );
  }
}
