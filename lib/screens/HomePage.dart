import 'package:flutter/material.dart';

import '../widgets/AddRecipeBottomSheet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddRecipeBottomSheet(),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
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
