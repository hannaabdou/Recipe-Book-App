import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRecipeCard extends StatefulWidget {
  final String title;
  final double rating;
  final int cookingTime;
  final String imageUrl;
  final VoidCallback targetPage;
  final bool showDeleteIcon;

  const CustomRecipeCard({
    Key? key,
    required this.imageUrl,
    this.title = '',
    required this.rating,
    required this.cookingTime,
    required this.targetPage,
    this.showDeleteIcon = false,
  }) : super(key: key);

  @override
  _CustomRecipeCardState createState() => _CustomRecipeCardState();
}

class _CustomRecipeCardState extends State<CustomRecipeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.targetPage,
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
                  widget.imageUrl,
                  fit: BoxFit.cover,
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
              bottom: 40,
              left: 20,
              child: SizedBox(
                width: 170.w,
                height: 40.h,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Visibility(
                visible: widget.showDeleteIcon,
                // نتحكم في إظهار الأيقونة بناءً على هذا المتغير
                child: Container(
                  width: 35.w,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        size: 20.r,
                      ),
                      color: Colors.teal,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              right: 10,
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.grey,
                        size: 16.r,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '${widget.cookingTime.toString()} min',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 5.h),
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
