import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/HomePage.dart';

class CustomRecipeCard extends StatelessWidget {
  final String title;

  // final String chefName;
  final double rating;
  final int cookingTime;
  final String imageUrl;
  final Widget targetPage;

  const CustomRecipeCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    // required this.chefName,
    required this.rating,
    required this.cookingTime,
    required this.targetPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        width: 370.w,
        height: 200.h,
        child: Stack(
          children: [
            // Container الخارجي مع الحواف المنحنية
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // حجم الانحناء
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            // الطبقة العلوية مع التدرج
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // نفس حجم الانحناء
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent, // البداية شفافة
                        Colors.black, // النهاية سوداء
                      ],
                      begin: Alignment.topCenter, // اتجاه التدرج (من الأعلى)
                      end: Alignment.bottomCenter, // إلى الأسفل
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: SizedBox(
                width: 170.w,
                height: 40.h,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 5,
            //   left: 10,
            //   child: Text(
            //     'By Chef $chefName',
            //     style: TextStyle(
            //       fontSize: 10,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFE1B3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 15.r),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.grey,
                        size: 20.r,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '${cookingTime.toString()} min',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 7.h),
                  Positioned(
                    top: 5,
                    right: 10,
                    child: Container(
                      width: 35.w,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            size: 20.r,
                          ),
                          color: Colors.teal,
                          onPressed: () {},
                        ),
                      ),
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
}
