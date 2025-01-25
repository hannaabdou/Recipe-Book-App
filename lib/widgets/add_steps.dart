import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';

class AddSteps extends StatefulWidget {
  const AddSteps({Key? key}) : super(key: key);

  @override
  State<AddSteps> createState() => _AddStepsState();
}

class _AddStepsState extends State<AddSteps> {
  final List<Map<String, dynamic>> steps = [];

  void _addStep() {
    setState(() {
      steps.add({
        'number': steps.length + 1,
        'controller': TextEditingController(),
      });
    });
  }

  void _removeStep(int index) {
    setState(() {
      steps.removeAt(index);
      for (int i = 0; i < steps.length; i++) {
        steps[i]['number'] = i + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...steps.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> step = entry.value;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12.r,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    '${step['number']}',
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    cursorColor: AppColors.primaryColor,
                    controller: step['controller'],
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Enter Step Description',
                      hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () => _removeStep(index),
                  child: Container(
                    height: 26.h,
                    width: 26.w,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 20.r,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        ElevatedButton.icon(
          onPressed: _addStep,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Add Steps',
            style: TextStyle(fontSize: 12.sp, color: Colors.white),
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
