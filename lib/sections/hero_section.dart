import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/social_link.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 160, bottom: 120, left: 20, right: 20),
      color: const Color(0xFFFAFAFA),
      child: Column(
        children: [
          Text(
            'Numaan Qureshi',
            style: GoogleFonts.inter(
              fontSize: 56,
              fontWeight: FontWeight.w800,
              height: 1.1,
              letterSpacing: -1.5,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Aspiring Cybersecurity Professional',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 16,
            children: [
              SocialLink(
                iconPath: 'assets/images/email.svg',
                label: 'numaanqureshi05@gmail.com',
                url: 'mailto:numaanqureshi05@gmail.com',
              ),
              SocialLink(
                iconPath: 'assets/images/linkedin.svg',
                label: 'linkedin.com/in/numaan-q/',
                url: 'https://www.linkedin.com/in/numaan-q/',
              ),
              SocialLink(
                iconPath: 'assets/images/github.svg',
                label: 'github.com/NumaanQureshi',
                url: 'https://www.github.com/NumaanQureshi',
              ),
            ],
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}