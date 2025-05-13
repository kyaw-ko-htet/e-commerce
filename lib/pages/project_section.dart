import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: 'Health Tracker',
        description: 'Track your fitness, water intake, and exercise.',
        image: 'assets/images/project1.png',
        url: 'https://github.com/yourname/health-tracker',
      ),
    ];

    return Column(
      children: [
        const SectionTitle(title: 'Projects'),
        ...projects.map((p) => ProjectCard(project: p)),
      ],
    );
  }
}
