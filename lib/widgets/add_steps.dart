import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';

class AddSteps extends StatefulWidget {
  const AddSteps({super.key});

  @override
  State<AddSteps> createState() => _AddStepsState();
}

class _AddStepsState extends State<AddSteps> {
  List<Map<String, dynamic>> ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ingredients.map((ingredient) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                // رقم العنصر
                CircleAvatar(
                  radius: 12.r,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    '${ingredient['number']}',
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
                SizedBox(width: 10.w),

                // حقل الإدخال
                Expanded(
                  child: TextField(
                    cursorColor: AppColors.primaryColor,
                    controller: ingredient['controller'],
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Enter Step Description',
                      hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // لون الحدود عندما يكون الحقل غير مفعل
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2), // لون الحدود عندما يكون الحقل مفعل
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),

                // زر الحذف
                InkWell(
                  onTap: () => setState(() {
                    // حذف العنصر
                    ingredients.remove(ingredient);

                    // إعادة الترقيم
                    for (int i = 0; i < ingredients.length; i++) {
                      ingredients[i]['number'] = i + 1;
                    }
                  }),
                  child: Container(
                    height: 26.h,
                    width: 26.w,
                    decoration: BoxDecoration(
                      color: Colors.redAccent, // لون الخلفية
                      shape: BoxShape.circle, // الشكل الدائري
                    ),
                    child: Icon(
                      Icons.delete_outline, // أيقونة الحذف
                      color: Colors.white, // لون الأيقونة
                      size: 20.r, // حجم الأيقونة
                    ),
                  ),
                ),
              ],
            ),
          );
        }),

        // زر الإضافة
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              ingredients.add({
                'number': ingredients.length + 1,
                'controller': TextEditingController(),
                'image': null, // الحقل يبدأ كـ null بدلاً من String
              });
            });
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: Text(
            'Add Steps',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
