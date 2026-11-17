import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Colors.black,
      child: Center(
        child: Text(
          '© 2026 Numaan Qureshi. All rights reserved.',
          style: GoogleFonts.inter(color: Colors.white54, fontSize: 12),
        ),
      ),
    );
  }
}