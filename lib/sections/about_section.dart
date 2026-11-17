import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFAFAFA),
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Computer Science graduate pursuing an M.S. in Computer Science at CUNY Brooklyn College.\n'
            'Experience building full-stack applications using C++, Python, Flutter, PostgreSQL, and Google Cloud.\n'
            'Passionate about software engineering and application security.\n'
            'Currently pursuing: CompTIA Security+.\n',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}