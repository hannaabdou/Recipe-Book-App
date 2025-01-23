import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/signInPageBody.dart';

class signInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: signInPageBody(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:recipe_book_app/screens/HomePage.dart';
// import 'package:recipe_book_app/screens/signUpPage.dart';
//
// class signInPage extends StatefulWidget {
//   const signInPage({super.key});
//
//   @override
//   State<signInPage> createState() => _signInPageState();
// }
//
// class _signInPageState extends State<signInPage> {
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//   bool _isPasswordVisible = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Adding listeners to handle focus changes
//     _emailFocusNode.addListener(() {
//       setState(() {});
//     });
//     _passwordFocusNode.addListener(() {
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 22.0, top: 90, right: 22.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Hello,',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 1),
//               const Text(
//                 'Welcome Back!',
//                 style: TextStyle(
//                   fontFamily: 'Poppins-SemiBold',
//                   fontSize: 20,
//                 ),
//               ),
//               const SizedBox(height: 60),
//               const Text(
//                 'Email',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 focusNode: _emailFocusNode,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your email',
//                   hintStyle: const TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                       vertical: 15.0, horizontal: 15.0),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: const BorderSide(color: Colors.grey),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide(
//                       color: _emailFocusNode.hasFocus
//                           ? const Color(0xff129575)
//                           : Colors.grey,
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 'Password',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 focusNode: _passwordFocusNode,
//                 obscureText: !_isPasswordVisible,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your Password',
//                   hintStyle: const TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                       vertical: 15.0, horizontal: 15.0),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: const BorderSide(color: Colors.grey),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide(
//                       color: _passwordFocusNode.hasFocus
//                           ? const Color(0xff129575)
//                           : Colors.grey,
//                       width: 2.0,
//                     ),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Padding(
//                 padding: EdgeInsets.only(left: 10.0),
//                 child: Text(
//                   'Forget Password?',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     color: Color(0xffFF9C00),
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 125, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     backgroundColor: const Color(0xff129575),
//                   ),
//                   child: const Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.login, color: Colors.white),
//                       SizedBox(width: 8),
//                       Text(
//                         'Sign in',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         thickness: 1.5,
//                         color: Colors.grey.shade400,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Text(
//                         'Or Sign in With',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 12,
//                           color: Colors.grey.shade500,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         thickness: 1.5,
//                         color: Colors.grey.shade400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 110.0),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/IMG/Icons/Google Icon.png'),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Image.asset('assets/IMG/Icons/Facebook Icon.png'),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 55.0),
//                 child: Row(
//                   children: [
//                     const Text(
//                       'Don’t have an account ?',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const signUpPage()),
//                         );
//                       },
//                       child: const Text(
//                         'Sign Up',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color(0xffFF9C00),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
