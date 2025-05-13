import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        leading: Image.asset(project.image, width: 60),
        title: Text(project.title),
        subtitle: Text(project.description),
        trailing: IconButton(
          icon: const Icon(Icons.open_in_new),
          onPressed: () => launchUrl(Uri.parse(project.url)),
        ),
      ),
    );
  }
}
