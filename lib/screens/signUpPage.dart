import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/signUpPageBody.dart';

class signUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: signUpPageBody(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:recipe_book_app/screens/HomePage.dart';
// import 'package:recipe_book_app/screens/signInPage.dart';
//
// class signUpPage extends StatefulWidget {
//   const signUpPage({super.key});
//
//   @override
//   State<signUpPage> createState() => _signUpPageState();
// }
//
// class _signUpPageState extends State<signUpPage> {
//   final FocusNode _nameFocusNode = FocusNode();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//   final FocusNode _confirmPasswordFocusNode = FocusNode();
//   bool _isPasswordVisible = false;
//   bool _rememberMe = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Adding listeners to handle focus changes
//     _nameFocusNode.addListener(() => setState(() {}));
//     _emailFocusNode.addListener(() => setState(() {}));
//     _passwordFocusNode.addListener(() => setState(() {}));
//     _confirmPasswordFocusNode.addListener(() => setState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _nameFocusNode.dispose();
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     _confirmPasswordFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 22.0, top: 50, right: 22.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Create an account',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 3),
//               const Text(
//                 'Let’s help you set up your account,',
//                 style: TextStyle(
//                   fontFamily: 'Poppins-SemiBold',
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 1),
//               const Text(
//                 'it won’t take long.',
//                 style: TextStyle(
//                   fontFamily: 'Poppins-SemiBold',
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 25),
//               _buildLabel('Name'),
//               _buildTextField(_nameFocusNode, 'Enter your name'),
//               const SizedBox(height: 20),
//               _buildLabel('Email'),
//               _buildTextField(_emailFocusNode, 'Enter your email'),
//               const SizedBox(height: 20),
//               _buildLabel('Password'),
//               _buildPasswordField(_passwordFocusNode),
//               const SizedBox(height: 20),
//               _buildLabel('Confirm Password'),
//               _buildPasswordField(_confirmPasswordFocusNode),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: _rememberMe,
//                     onChanged: (value) {
//                       setState(() {
//                         _rememberMe = value!;
//                       });
//                     },
//                     fillColor: WidgetStateProperty.resolveWith<Color>(
//                       (Set<WidgetState> states) {
//                         if (states.contains(WidgetState.selected)) {
//                           return const Color(0xffFF9C00);
//                         }
//                         return const Color.fromARGB(
//                             255, 255, 255, 255); // Fill color when unchecked
//                       },
//                     ),
//                     side: const BorderSide(
//                       color: Color(0xffFF9C00),
//                       width: 2.0,
//                     ),
//                   ),
//                   const Text(
//                     'Accept terms & Condition',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       color: Color(0xffFF9C00),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 1),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage()),
//                     );
//                   },                  style: ElevatedButton.styleFrom(
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
//                         'Sign up',
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
//                 height: 10,
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
//                 height: 5,
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
//                 height: 5,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 75.0),
//                 child: Row(
//                   children: [
//                     const Text(
//                       'Already a member?',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => signInPage()),
//                         );
//                       },
//                       child: const Text(
//                         'Sign In',
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
//
//   Widget _buildLabel(String label) {
//     return Text(
//       label,
//       style: const TextStyle(
//         fontFamily: 'Poppins',
//         fontSize: 16,
//       ),
//     );
//   }
//
//   Widget _buildTextField(FocusNode focusNode, String hintText) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 7.0),
//       child: TextField(
//         focusNode: focusNode,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 14,
//             color: Colors.grey,
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(
//               color: focusNode.hasFocus ? const Color(0xff129575) : Colors.grey,
//               width: 2.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPasswordField(FocusNode focusNode) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 7.0),
//       child: TextField(
//         focusNode: focusNode,
//         obscureText: !_isPasswordVisible,
//         decoration: InputDecoration(
//           hintText: 'Enter your password',
//           hintStyle: const TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 14,
//             color: Colors.grey,
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(
//               color: focusNode.hasFocus ? const Color(0xff129575) : Colors.grey,
//               width: 2.0,
//             ),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(
//               _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//               color: Colors.grey,
//             ),
//             onPressed: () {
//               setState(() {
//                 _isPasswordVisible = !_isPasswordVisible;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
