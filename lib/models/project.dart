class Project {
  final String name;
  final String image;
  final String description;
  final List<String> techStack;
  final String? githubUrl;
  // final String? liveUrl;

  const Project({
    required this.name,
    required this.image,
    required this.description,
    required this.techStack,
    this.githubUrl,
    // this.liveUrl,
  });
}

const List<Project> portfolioProjects = [
  Project(
    name: 'Journey - AI-Assisted Fitness Tracking App',
    image: 'assets/images/updated_journey_logo.png',
    description:
        'An intelligent fitness tracking application designed to help users log workouts, monitor progress, and receive AI-assisted personalized training insights and recommendations.',
    techStack: ['Flutter', 'Python', 'PostgreSQL', 'Google Cloud'],
    githubUrl: 'https://github.com/NumaanQureshi/Journey',
  ),
  Project(
    name: 'CommonSens - Universal Sensitivity Matching and Tracking',
    image: 'assets/images/cs_logo_full.png',
    description:
        'A sensitivity matcher / converter to keep a consistent feel across multiple titles. Supports DPI switching and local history of changes.',
    techStack: ['C++', 'Python', 'PostgreSQL'],
    githubUrl: 'https://github.com/NumaanQureshi/common-sens',
  ),
  Project(
    name: 'PWVault - Encrypted Password & Notes Storage',
    image: 'assets/images/pwvault_logo.png',
    description:
        'A security-focused vault application for storing sensitive passwords and encrypted notes locally and in the cloud, utilizing strong cryptographic standards to protect user data.',
    techStack: ['Flutter', 'JavaScript', 'Cryptography', 'Application Security'],
    githubUrl: 'https://gitlab.com/NumaanQureshi1/pwvault',
  )
];