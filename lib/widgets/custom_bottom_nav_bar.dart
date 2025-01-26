import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/add_recipe_page.dart';
import 'curved_bottom_bar_painter.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvedBottomBarPainter(),
      child: SizedBox(
        height: 60.h,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon(Icons.home, 0),
                _buildIcon(Icons.search, 1),
                SizedBox(width: 80.w),
                _buildIcon(Icons.person, 2),
                _buildIcon(Icons.settings, 3),
              ],
            ),
            Center(
              heightFactor: 0.5.h,
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white, size: 25.sp),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRecipePage(),
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
        size: 22.sp,
        color: selectedIndex == index ? Colors.teal : Colors.grey,
      ),
    );
  }
}
