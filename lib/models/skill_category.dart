class SkillCategory {
  final String title;
  final List<String> skills;

  const SkillCategory({
    required this.title,
    required this.skills,
  });
}

const List<SkillCategory> portfolioSkills = [
  SkillCategory(
    title: 'Programming Languages',
    skills: ['C++', 'Python', 'Dart', 'JavaScript'],
  ),
  SkillCategory(
    title: 'Frameworks',
    skills: ['Flutter', 'Flask'],
  ),
  SkillCategory(
    title: 'Databases & Cloud',
    skills: ['PostgreSQL', 'Google Cloud'],
  ),
  SkillCategory(
    title: 'DevOps & Version Control',
    skills: ['Git / GitHub / GitLab', 'CI/CD Pipelining'],
  ),
  SkillCategory(
    title: 'Operating Systems & Tools',
    skills: ['Windows', 'macOS', 'PowerShell', 'VS Code'],
  ),
];