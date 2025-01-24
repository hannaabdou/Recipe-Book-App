import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/recipe_details_body.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        title: 'Recipe Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: RecipeDetailsBody(
          recipeName: 'Spicy Chicken Burger with French Fries',
          recipeDescription:
              'Delicious spicy chicken burger paired with crispy golden French fries – the perfect combo for a flavorful meal!',
        ),
      ),
    );
  }
}

// class recipePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(onPressed: () {}),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Recipe Image and Info Section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Recipe Image
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(16.0),
//                   child: Image.network(
//                     'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGJ1cmdlcnxlbnwwfHwwfHx8MA%3D%3D',
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // Recipe Title
//                 Text(
//                   'Spicy chicken burger with French fries',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 // Recipe Details (Time and Rating)
//                 Row(
//                   children: [
//                     Icon(Icons.timer, size: 16, color: Colors.grey),
//                     SizedBox(width: 4),
//                     Text('20 min', style: TextStyle(color: Colors.grey)),
//                     SizedBox(width: 16),
//                     Icon(Icons.star, size: 16, color: Colors.orange),
//                     SizedBox(width: 4),
//                     Text('4.0', style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           SizedBox(height: 16),
//
//           // Tabs Section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               children: [
//                 // Ingredient Tab
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Handle Ingredient Tab Click
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     child: Text('Ingredient',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 // Procedure Tab
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Handle Procedure Tab Click
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey[200],
//                       foregroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     child: Text('Procedure',
//                         style: TextStyle(color: Colors.black)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           SizedBox(height: 16),
//
//           // Ingredients List Section
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               itemCount: 5, // Number of ingredients
//               itemBuilder: (context, index) {
//                 // Ingredient Details
//                 final ingredients = [
//                   {
//                     'name': 'Tomatoes',
//                     'quantity': '500g',
//                     'image':
//                         'https://media.istockphoto.com/id/157483981/photo/two-whole-red-ripe-tomatoes-and-one-in-half.webp?a=1&b=1&s=612x612&w=0&k=20&c=6QPzgL1YZLoRYFda-mfaJaCyrFxva4P3CjYhxxd3GyM='
//                   },
//                   {
//                     'name': 'Cabbage',
//                     'quantity': '300g',
//                     'image':
//                         'https://media.istockphoto.com/id/673162168/photo/green-cabbage-isolated-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=ZP60qRssN-g5D7KLtMkYrXuzh4jnmsirmu91CuqqsZ4='
//                   },
//                   {
//                     'name': 'Taco',
//                     'quantity': '300g',
//                     'image':
//                         'https://plus.unsplash.com/premium_photo-1672753749156-6281cfeb25f9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8dGFjbyUyMHBsYW58ZW58MHx8MHx8fDA%3D'
//                   },
//                   {
//                     'name': 'Slice Bread',
//                     'quantity': '300g',
//                     'image':
//                         'https://media.istockphoto.com/id/185253149/photo/loafs-of-bread-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=50lunvWD_FhBoGRwBLrK07d2nQNjL-xQAS1qpEYyOGc='
//                   },
//                   {
//                     'name': 'Green Onion',
//                     'quantity': '300g',
//                     'image':
//                         'https://media.istockphoto.com/id/117713123/photo/whole-and-chopped-green-onions-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=bk3QqQsNCEbxAmtcgSDBsgoG-a9LxpWClWSpDZivqgo='
//                   },
//                 ];
//
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 12.0),
//                   padding: EdgeInsets.all(12.0),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Ingredient Icon and Name
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundImage:
//                                 NetworkImage(ingredients[index]['image']!),
//                           ),
//                           SizedBox(width: 12),
//                           Text(
//                             ingredients[index]['name']!,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       // Ingredient Quantity
//                       Text(
//                         ingredients[index]['quantity']!,
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
