import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  late AnimationController _controller;
  late Animation<Color?> _recipeButtonColor;
  late Animation<Color?> _savedRecipesButtonColor;

  bool showRecipes = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _recipeButtonColor = ColorTween(begin: Colors.green, end: Colors.grey[200])
        .animate(_controller);
    _savedRecipesButtonColor = ColorTween(
            begin: Colors.grey[200], end: const Color.fromRGBO(76, 175, 80, 1))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  void _toggleTab(bool showRecipeTab) {
    setState(() {
      showRecipes = showRecipeTab;
      if (showRecipes) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button action
          },
        ),
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),

            // Profile Image Section
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _selectedImage != null
                    ? FileImage(File(_selectedImage!.path))
                    : NetworkImage(
                        'https://via.placeholder.com/150',
                      ) as ImageProvider,
                child: _selectedImage == null
                    ? Icon(Icons.camera_alt, size: 32, color: Colors.white)
                    : null,
              ),
            ),
            SizedBox(height: 16),

            // User Info Section
            Text(
              ' user',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Chef',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              ' write the text',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            SizedBox(height: 16),

            // Tabs Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => ElevatedButton(
                        onPressed: () => _toggleTab(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _recipeButtonColor.value,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Recipe',
                          style: TextStyle(
                              color: showRecipes
                                  ? Colors.white
                                  : const Color.fromRGBO(76, 175, 80, 1)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => ElevatedButton(
                        onPressed: () => _toggleTab(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _savedRecipesButtonColor.value,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Saved Recipes',
                          style: TextStyle(
                              color: showRecipes
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Recipe List Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  if (showRecipes)
                    Column(
                      children: [
                        _buildRecipeCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500&auto=format&fit=crop&q=60',
                          title: 'Traditional spare ribs baked',
                          author: 'Chef John',
                          time: '20 min',
                          rating: '4.0',
                        ),
                        SizedBox(height: 16),
                        _buildRecipeCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1604908177522-31020b19a696?w=500&auto=format&fit=crop&q=60',
                          title: 'Spice roasted chicken with flavored rice',
                          author: 'Mark Kelvin',
                          time: '20 min',
                          rating: '4.0',
                        ),
                      ],
                    ),
                  if (!showRecipes)
                    Center(
                      child: Text(
                        'No saved recipes yet.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard({
    required String imageUrl,
    required String title,
    required String author,
    required String time,
    required String rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text('By $author',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.timer, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(time,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(width: 16),
                    Icon(Icons.star, size: 14, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(rating,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
