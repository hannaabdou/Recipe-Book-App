import 'package:flutter/material.dart';

class CustomFilter extends StatefulWidget {
  final List<String> filters;

  const CustomFilter({
    Key? key,
    required this.filters,
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color:
                    _selectedIndex == index ? Colors.teal : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _selectedIndex == index
                        ? Colors.white
                        : Color(0xFFFF71B1A1),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
