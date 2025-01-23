import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/signInPage.dart';
import 'package:recipe_book_app/widgets/CustomButton.dart';

class startPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/IMG/Wallpaper.png',
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/IMG/Icons/Logo 2.png', // Replace with your logo path
                  width: 80.w, // Adjust logo size
                  height: 80.h,
                ),
                SizedBox(height: 7.h),
                // Text
                Text(
                  '100K+ Premium Recipe ',
                  // Replace with your app name or slogan
                  style: TextStyle(
                    fontSize: 17.sp,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Recipe Rleam', // Replace with your app name or slogan
                  style: TextStyle(
                    fontSize: 30.sp,
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Simple way to find Tasty Recipe',
                  // Replace with your app name or slogan
                  style: TextStyle(
                    fontSize: 10.sp,
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins-Thin',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CustomButton(
              title: 'Start Cooking',
              titleSize: 16.sp,
              titleColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => signInPage(),
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:recipe_book_app/screens/signInPage.dart';
//
// class startPage extends StatefulWidget {
//   const startPage({super.key});
//
//   @override
//   _startPageState createState() => _startPageState();
// }
//
// class _startPageState extends State<startPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets/IMG/Wallpaper.png',
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 100.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Logo
//                 Image.asset(
//                   'assets/IMG/Icons/Logo.png', // Replace with your logo path
//                   width: 120, // Adjust logo size
//                   height: 120,
//                 ),
//                 const SizedBox(height: 10),
//                 // Text
//                 const Text(
//                   '100K+ Premium Recipe ', // Replace with your app name or slogan
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 150,
//                 ),
//                 const Text(
//                   'Recipe Rleam', // Replace with your app name or slogan
//                   style: TextStyle(
//                     fontSize: 50,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   'Simple way to find Tasty Recipe', // Replace with your app name or slogan
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 140,
//                 ),
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const signInPage()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 50, vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         backgroundColor: const Color(0xff129575),
//                       ),
//                       child: const Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'Start Cooking',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Icon(Icons.arrow_forward, color: Colors.white),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
