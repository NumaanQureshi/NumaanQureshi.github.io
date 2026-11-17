import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        color: Color(0xFF0A0C0E),
        border: Border(
          top: BorderSide(color: Colors.white10, width: 1),
        ),
      ),
      child: Center(
        child: Text(
          '© 2026 Numaan Qureshi. All rights reserved.',
          style: GoogleFonts.inter(
            color: const Color(0xFF6B7280),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}