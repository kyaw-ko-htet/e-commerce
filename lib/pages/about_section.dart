import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          child: Icon(Icons.person, size: 50),
        ),
        SectionTitle(title: 'About Me'),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Hi, I'm a Flutter developer with experience building beautiful cross-platform apps. I enjoy working on performance and UI/UX details.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
