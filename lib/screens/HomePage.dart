import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> filters = [
    'Ingredient',
    'Procedure',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// iconSize: 100,
// iconColor: Colors.white,
// backgroundColor: AppColors.primaryColor,
// ),
// onPressed: () {
// showModalBottomSheet(
// context: context,
// isScrollControlled: true,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(16),
// topLeft: Radius.circular(16)),
// ),
// builder: (context) => AddRecipeBottomSheet(),
// );
// },
// child: Icon(
// Icons.add,
// ),
// )
