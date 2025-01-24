import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';

class CustomFilter extends StatefulWidget {
  final List<String> filters;
  final double paddingHorizontal;
  final double paddingVertical;
  final ValueChanged<int> onFilterChanged; // لإرسال الإشارة عند تغيير الفلتر

  const CustomFilter({
    Key? key,
    required this.filters,
    required this.onFilterChanged,
    this.paddingHorizontal = 16,
    this.paddingVertical = 7,
  }) : super(key: key);

  @override
  _CustomFilterState createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  int _selectedIndex = 0;

  void _onFilterSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onFilterChanged(index); // إرسال الإشارة عند تغيير الفلتر
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
                  // اللون الرمادي عندما لا يكون محددًا
                  width: 1, // سمك الحدود
                ),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: _selectedIndex == index
                      ? Colors.white
                      : Color(0xFFFF71B1A1),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
