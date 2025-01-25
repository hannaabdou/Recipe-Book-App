import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_step_card.dart';
import '../data/step_box.dart';

class ListStep extends StatelessWidget {
  final List<StepBox> steps;

  const ListStep({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final step = steps[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 7.h),
          child: Column(
            children: [
              CustomStepCard(
                stepNumber: step.stepNumber,
                description: step.description,
              ),
              Text(''),
            ],
          ),
        );
      },
    );
  }
}
