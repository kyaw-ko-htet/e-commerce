import 'package:flutter/material.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'project_section.dart';
import 'skill_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutSection(),
            SkillSection(),
            ProjectSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
