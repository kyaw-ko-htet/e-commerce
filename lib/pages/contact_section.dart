import 'package:flutter/material.dart';
import '../widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void _launchEmail() {
    launchUrl(Uri.parse('mailto:your.email@example.com'));
  }

  void _launchResume() {
    launchUrl(Uri.parse('assets/resume/resume.pdf'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Contact'),
        const Text('Email: your.email@example.com'),
        ElevatedButton(
          onPressed: _launchEmail,
          child: const Text('Send Email'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _launchResume,
          child: const Text('Download Resume'),
        ),
      ],
    );
  }
}
