import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

// URL = https://numaanqureshi.github.io/

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkBase = ThemeData.dark(useMaterial3: true);

    return MaterialApp(
      title: 'Numaan Qureshi',
      debugShowCheckedModeBanner: false,
      theme: darkBase.copyWith(
        textTheme: GoogleFonts.interTextTheme(darkBase.textTheme).apply(
          bodyColor: const Color(0xFFF3F4F6),
          displayColor: const Color(0xFFF3F4F6),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
          surface: const Color(0xFF0E0E14),
        ),
        scaffoldBackgroundColor: const Color(0xFF07070A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF07070A),
          foregroundColor: Color(0xFFF3F4F6),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}