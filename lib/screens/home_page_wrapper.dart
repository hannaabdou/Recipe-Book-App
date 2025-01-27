import 'package:flutter/material.dart';
import 'package:recipe_book_app/widgets/home_screen.dart';
import 'package:recipe_book_app/widgets/profile_screen.dart';
import 'package:recipe_book_app/widgets/search_screen.dart';
import 'package:recipe_book_app/widgets/setting_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  _HomePageWrapperState createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _recipes = [];

  void _addRecipe(Map<String, dynamic> recipe) {
    setState(() {
      _recipes.add(recipe);
    });
  }

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomeScreen(),
      SearchScreen(),
      ProfileScreen(recipes: _recipes),
      SettingScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        addRecipe: _addRecipe, // Pass the callback
      ),
    );
  }
}
