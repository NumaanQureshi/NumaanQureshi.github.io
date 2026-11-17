import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/url_helper.dart';

class SocialLink extends StatelessWidget {
  final String iconPath;
  final String label;
  final String url;
  final bool tintIcon;

  const SocialLink({
    super.key,
    required this.iconPath,
    required this.label,
    required this.url,
    this.tintIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchExternalUrl(url),
      borderRadius: BorderRadius.circular(8),
      hoverColor: const Color(0xFF34D399).withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: tintIcon
                  ? const ColorFilter.mode(Color(0xFFD1D5DB), BlendMode.srcIn)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFD1D5DB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}