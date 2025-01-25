import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';

class CustomRecipeCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final VoidCallback targetPage;
  final bool showDeleteIcon;

  const CustomRecipeCard({
    super.key,
    required this.imageUrl,
    this.title = '',
    required this.targetPage,
    this.showDeleteIcon = false,
  });

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
                child: Image.network(
                  widget.imageUrl,
                  // استخدام Image.network لعرض الصورة من الإنترنت
                  fit: BoxFit.cover, // ملائمة الصورة لاحتلال المساحة كاملة
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
                width: 200.w,
                child: CustomTextStyle(
                  text: widget.title,
                  textFamily: 'Poppins-SemiBold',
                  textLetterSpacing: 1.w,
                  textWordSpacing: 3.w,
                  textSize: 16.sp,
                  textColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Visibility(
                visible: widget.showDeleteIcon,
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
              child: Container(
                width: 35.w,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
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
    );
  }
}
