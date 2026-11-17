import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/project.dart';
import 'project_detail_dialog.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF5F5F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: const BorderSide(color: Colors.black12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => showProjectDetailDialog(context, project),
        hoverColor: Colors.black.withValues(alpha: 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                color: const Color(0xFFEEEEEE),
                child: Image.asset(
                  project.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.open_in_full,
                    size: 16,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}