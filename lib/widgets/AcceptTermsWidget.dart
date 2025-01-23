import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/textButton.dart';

import '../utils/colors.dart';

class AcceptTermsWidget extends StatefulWidget {
  @override
  _AcceptTermsWidgetState createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: AppColors.textButtonColor, // لون التفعيل
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        textButton(
          onPressed: () {
            setState(
              () {
                isChecked = !isChecked;
              },
            );
          },
          text: 'Accept terms & Condition',
          textSize: 10.sp,
          textColor: AppColors.textButtonColor,
        ),
      ],
    );
  }
}
