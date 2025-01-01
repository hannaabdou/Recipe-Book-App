import 'package:flutter/material.dart';

import '../widgets/CustomFilter.dart';

class HomePage extends StatelessWidget {
  final List<String> filters = [
    'Ingredient',
    'Procedure',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomFilter(
          filters: filters,
        ),
      ),
    );
  }
}
