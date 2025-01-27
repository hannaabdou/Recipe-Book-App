import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/add_recipe_form.dart';
import 'curved_bottom_bar_painter.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final Function(Map<String, dynamic>) addRecipe;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.addRecipe,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvedBottomBarPainter(),
      child: SizedBox(
        height: 50.h,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon(Icons.home, 0),
                _buildIcon(Icons.search, 1),
                SizedBox(width: 60.w),
                _buildIcon(Icons.person, 2),
                _buildIcon(Icons.settings, 3),
              ],
            ),
            Center(
              heightFactor: 0.5,
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white, size: 25.r),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRecipeForm(
                          addRecipe: addRecipe, // Pass the callback
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return IconButton(
      onPressed: () => onItemSelected(index),
      icon: Icon(
        icon,
        size: 22.r,
        color: selectedIndex == index ? Colors.teal : Colors.grey,
      ),
    );
  }
}
