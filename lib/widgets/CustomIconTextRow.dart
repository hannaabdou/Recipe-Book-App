import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconTextRow extends StatelessWidget {
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final FontWeight titleWeight;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final double? rightIconSize;
  final double? leftIconSize;
  final Color? rightIconColor;
  final Color? leftIconColor;

  const CustomIconTextRow({
    Key? key,
    required this.title,
    this.titleSize,
    this.rightIcon,
    this.leftIcon,
    this.rightIconSize,
    this.leftIconSize,
    this.titleWeight = FontWeight.bold,
    this.titleColor,
    this.rightIconColor,
    this.leftIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[
          Icon(
            leftIcon,
            color: leftIconColor ?? Colors.black,
            // تعيين لون افتراضي إذا لم يتم تحديده
            size: leftIconSize ?? 24.r, // تعيين حجم افتراضي
          ),
          const SizedBox(width: 5),
        ],
        Text(
          title,
          style: TextStyle(
            color: titleColor ?? Colors.black, // تعيين لون افتراضي
            fontSize: titleSize ?? 16.sp, // تعيين حجم افتراضي
            fontWeight: titleWeight,
          ),
        ),
        if (rightIcon != null) ...[
          const SizedBox(width: 5),
          Icon(
            rightIcon,
            color: rightIconColor ?? Colors.black, // تعيين لون افتراضي
            size: rightIconSize ?? 24.r, // تعيين حجم افتراضي
          ),
        ],
      ],
    );
  }
}
