import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';

class CustomFilter extends StatefulWidget {
  final List<String> filters;
  final double paddingHorizontal;
  final double paddingVertical;
  final ValueChanged<int> onFilterChanged;
  const CustomFilter({
    super.key,
    required this.filters,
    required this.onFilterChanged,
    this.paddingHorizontal = 16,
    this.paddingVertical = 7,
  });

  @override
  _CustomFilterState createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  int _selectedIndex = 0;

  void _onFilterSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onFilterChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.filters.asMap().entries.map((entry) {
          int index = entry.key;
          String filter = entry.value;

          return GestureDetector(
            onTap: () => _onFilterSelected(index),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.paddingHorizontal.w,
                vertical: widget.paddingVertical.h,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: _selectedIndex == index ? 0 : 4),
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: _selectedIndex == index
                      ? Colors.transparent
                      : AppColors.primaryColor,
                  width: 1,
                ),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: _selectedIndex == index
                      ? Colors.white
                      : Color(0xffff71b1a1),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
