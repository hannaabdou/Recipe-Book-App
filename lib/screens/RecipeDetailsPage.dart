import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  final String title;
  final String author;
  final String duration;

  RecipeDetailsPage(
      {required this.title, required this.author, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('By $author • $duration', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Recipe details go here...'),
          ],
        ),
      ),
    );
  }
}
