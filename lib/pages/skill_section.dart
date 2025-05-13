import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Provider'];
    return Column(
      children: [
        const SectionTitle(title: 'Skills'),
        Wrap(
          spacing: 10,
          children: skills.map((skill) => Chip(label: Text(skill))).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
