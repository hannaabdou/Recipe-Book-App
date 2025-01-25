import 'package:flutter/material.dart';
import 'package:recipe_book_app/widgets/custom_step_card.dart';

class ListStep extends StatelessWidget {
  final List<Map<String, dynamic>> steps;

  const ListStep({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final step = steps[index];
        return CustomStepCard(
          stepNumber: step['stepNumber'],
          description: step['description'],
        );
      },
    );
  }
}
