import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/social_link.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF07070A),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // top left gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.45, -0.35),
                  radius: 0.85,
                  colors: [
                    const Color(0xFF6366F1).withValues(alpha: 0.14),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // bottom right gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.45, 0.25),
                  radius: 0.9,
                  colors: [
                    const Color(0xFF9333EA).withValues(alpha: 0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // buttom gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, 0.55),
                  radius: 0.7,
                  colors: [
                    const Color(0xFF4F46E5).withValues(alpha: 0.10),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 160,
              bottom: 120,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Text(
                  'Numaan Qureshi',
                  style: GoogleFonts.inter(
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    letterSpacing: -1.5,
                    color: const Color(0xFFF3F4F6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'Aspiring Cybersecurity Professional',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF9CA3AF),
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
                      label: 'numaan1@hotmail.com',
                      url: 'mailto:numaan1@hotmail.com',
                      tintIcon: true,
                    ),
                    SocialLink(
                      iconPath: 'assets/images/linkedin.svg',
                      label: 'linkedin.com/in/numaan-q/',
                      url: 'https://www.linkedin.com/in/numaan-q/',
                      tintIcon: false,
                    ),
                    SocialLink(
                      iconPath: 'assets/images/github.svg',
                      label: 'github.com/NumaanQureshi',
                      url: 'https://www.github.com/NumaanQureshi',
                      tintIcon: true,
                    ),
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}