import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/skill_category.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF07070A),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Skills',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      color: const Color(0xFFF3F4F6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              ...portfolioSkills.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: category.skills
                            .map((skill) => SkillBox(label: skill))
                            .toList(),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillBox extends StatefulWidget {
  final String label;

  const SkillBox({super.key, required this.label});

  @override
  State<SkillBox> createState() => _SkillBoxState();
}

class _SkillBoxState extends State<SkillBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    const emerald = Color(0xFF34D399);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: emerald.withValues(alpha: _isHovered ? 0.2 : 0.1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: emerald.withValues(alpha: _isHovered ? 0.7 : 0.3),
          ),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: emerald,
          ),
        ),
      ),
    );
  }
}