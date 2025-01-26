import 'package:flutter/material.dart';

class CustomRecipeCard extends StatelessWidget {
  final String title;
  final String chefName;
  final double rating;
  final String cookingTime;
  final String imageUrl;
  final VoidCallback onFavoritePressed;
  final VoidCallback targetPage;

  const CustomRecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.chefName,
    required this.rating,
    required this.cookingTime,
    required this.onFavoritePressed,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: targetPage,
      child: SizedBox(
        width: 370,
        height: 200,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 10,
              child: Text(
                'By Chef $chefName',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 10,
              child: Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    cookingTime,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 10,
              child: Container(
                width: 35,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 20,
                  ),
                  color: Colors.teal,
                  onPressed: () {},
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Color(0xffffffe1b3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 15),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
