/*
import 'package:recipe_book_app/data/recipe_box.dart';
import 'package:recipe_book_app/data/step_box.dart';

import 'ingredient_box.dart';

class StaticRecipe {
  static List<RecipeBox> recipes = [
    RecipeBox(
      id: 1,
      name: "Spaghetti Bolognese",
      description: "Delicious Italian pasta with rich meat sauce.",
      category: "Dinner",
      imageUrl: "assets/IMG/Recipe Photos/Spaghetti Bolognese.jpeg",
      ingredients: [
        IngredientBox(
            name: "Spaghetti",
            imageUrl: "assets/IMG/Ingredient Photos/Spaghetti.png"),
        IngredientBox(
            name: "Ground Beef",
            imageUrl: "assets/IMG/Ingredient Photos/Ground Beef.png"),
        IngredientBox(
            name: "Tomato Sauce",
            imageUrl: "assets/IMG/Ingredient Photos/Tomato Sauce.png"),
        IngredientBox(
            name: "Garlic",
            imageUrl: "assets/IMG/Ingredient Photos/Garlic.png"),
        IngredientBox(
            name: "Onion", imageUrl: "assets/IMG/Ingredient Photos/Onion.png"),
        IngredientBox(
            name: "Olive Oil",
            imageUrl: "assets/IMG/Ingredient Photos/Olive Oil.png"),
        // Add more ingredients if needed
      ],
      steps: [
        StepBox(
            stepNumber: 1,
            description:
                "Boil the spaghetti according to the package instructions."),
        StepBox(
            stepNumber: 2,
            description: "Cook the ground beef in olive oil until browned."),
        StepBox(
            stepNumber: 3,
            description: "Add chopped garlic and onion, cook until softened."),
        StepBox(
            stepNumber: 4,
            description: "Pour in the tomato sauce and simmer for 10 minutes."),
        StepBox(
            stepNumber: 5,
            description: "Combine the spaghetti with the sauce and serve."),
        // Add more steps if needed
      ],
    ),
    RecipeBox(
      id: 2,
      name: "Chicken Alfredo",
      description: "Creamy pasta with grilled chicken and Alfredo sauce.",
      category: "Chicken",
      imageUrl: "assets/IMG/Recipe Photos/Chicken Alfredo.jpeg",
      ingredients: [
        IngredientBox(
            name: "Fettuccine",
            imageUrl: "assets/IMG/Ingredient Photos/Fettuccine.png"),
        IngredientBox(
            name: "Chicken Breast",
            imageUrl: "assets/IMG/Ingredient Photos/Chicken Breast.png"),
        IngredientBox(
            name: "Heavy Cream",
            imageUrl: "assets/IMG/Ingredient Photos/Heavy Cream.png"),
        IngredientBox(
            name: "Parmesan Cheese",
            imageUrl: "assets/IMG/Ingredient Photos/Parmesan Cheese.png"),
        IngredientBox(
            name: "Butter",
            imageUrl: "assets/IMG/Ingredient Photos/Butter.png"),
        IngredientBox(
            name: "Garlic",
            imageUrl: "assets/IMG/Ingredient Photos/Garlic.png"),
        // Add more ingredients if needed
      ],
      steps: [
        StepBox(
            stepNumber: 1,
            description: "Grill the chicken breast and slice into strips."),
        StepBox(
            stepNumber: 2,
            description:
                "Cook the fettuccine pasta according to the package instructions."),
        StepBox(
            stepNumber: 3,
            description: "In a pan, melt butter and sauté garlic."),
        StepBox(
            stepNumber: 4,
            description: "Add heavy cream and simmer until thickened."),
        StepBox(
            stepNumber: 5,
            description:
                "Stir in parmesan cheese until the sauce becomes creamy."),
        StepBox(
            stepNumber: 6,
            description: "Toss the pasta and chicken together with the sauce."),
        // Add more steps if needed
      ],
    ),
    RecipeBox(
      id: 3,
      name: "Margherita Pizza",
      description: "Classic pizza topped with tomatoes, mozzarella, and basil.",
      category: "Vegetarian",
      imageUrl: "assets/IMG/Recipe Photos/Margherita Pizza.jpeg",
      ingredients: [
        IngredientBox(
            name: "Pizza Dough",
            imageUrl: "assets/IMG/Ingredient Photos/Pizza Dough.png"),
        IngredientBox(
            name: "Mozzarella Cheese",
            imageUrl: "assets/IMG/Ingredient Photos/Mozzarella Cheese.png"),
        IngredientBox(
            name: "Tomatoes",
            imageUrl: "assets/IMG/Ingredient Photos/Tomatoes.png"),
        IngredientBox(
            name: "Fresh Basil",
            imageUrl: "assets/IMG/Ingredient Photos/Fresh Basil.png"),
        IngredientBox(
            name: "Olive Oil",
            imageUrl: "assets/IMG/Ingredient Photos/Olive Oil.png"),
        IngredientBox(
            name: "Salt", imageUrl: "assets/IMG/Ingredient Photos/Salt.png"),
        // Add more ingredients if needed
      ],
      steps: [
        StepBox(
            stepNumber: 1, description: "Preheat the oven to 475°F (245°C)."),
        StepBox(
            stepNumber: 2,
            description: "Roll out the pizza dough on a floured surface."),
        StepBox(
            stepNumber: 3,
            description: "Spread a thin layer of tomato sauce on the dough."),
        StepBox(
            stepNumber: 4,
            description:
                "Top with mozzarella cheese, sliced tomatoes, and fresh basil."),
        StepBox(
            stepNumber: 5,
            description:
                "Drizzle olive oil over the pizza and sprinkle with salt."),
        StepBox(
            stepNumber: 6,
            description:
                "Bake the pizza for 10-12 minutes until golden and crispy."),
        // Add more steps if needed
      ],
    ),
    RecipeBox(
      id: 4,
      name: "Caesar Salad",
      description: "Crispy lettuce with creamy Caesar dressing and croutons.",
      category: "Lunch",
      imageUrl: "assets/IMG/Recipe Photos/Caesar Salad.jpeg",
      ingredients: [
        IngredientBox(
            name: "Lettuce",
            imageUrl: "assets/IMG/Ingredient Photos/Lettuce.png"),
        IngredientBox(
            name: "Caesar Dressing",
            imageUrl: "assets/IMG/Ingredient Photos/Caesar Dressing.png"),
        IngredientBox(
            name: "Croutons",
            imageUrl: "assets/IMG/Ingredient Photos/Croutons.png"),
        IngredientBox(
            name: "Parmesan Cheese",
            imageUrl: "assets/IMG/Ingredient Photos/Parmesan Cheese.png"),
        IngredientBox(
            name: "Garlic",
            imageUrl: "assets/IMG/Ingredient Photos/Garlic.png"),
        // Add more ingredients if needed
      ],
      steps: [
        StepBox(
            stepNumber: 1,
            description: "Wash and chop the lettuce into bite-sized pieces."),
        StepBox(
            stepNumber: 2,
            description: "In a bowl, mix the lettuce with Caesar dressing."),
        StepBox(
            stepNumber: 3,
            description:
                "Top with croutons and freshly grated Parmesan cheese."),
        StepBox(
            stepNumber: 4,
            description: "Optional: Add garlic for extra flavor."),
        // Add more steps if needed
      ],
    ),
    RecipeBox(
      id: 5,
      name: "Beef Tacos",
      description: "Tacos filled with spiced ground beef and fresh toppings.",
      category: "Beef",
      imageUrl: "assets/IMG/Recipe Photos/Beef Tacos.jpeg",
      ingredients: [
        IngredientBox(
            name: "Ground Beef",
            imageUrl: "assets/IMG/Ingredient Photos/Ground Beef.png"),
        IngredientBox(
            name: "Taco Shells",
            imageUrl: "assets/IMG/Ingredient Photos/Taco Shells.png"),
        IngredientBox(
            name: "Cheddar Cheese",
            imageUrl: "assets/IMG/Ingredient Photos/Cheddar Cheese.png"),
        IngredientBox(
            name: "Lettuce",
            imageUrl: "assets/IMG/Ingredient Photos/Lettuce.png"),
        IngredientBox(
            name: "Tomatoes",
            imageUrl: "assets/IMG/Ingredient Photos/Tomatoes.png"),
        IngredientBox(
            name: "Sour Cream",
            imageUrl: "assets/IMG/Ingredient Photos/Sour Cream.png"),
        IngredientBox(
            name: "Taco Sauce",
            imageUrl: "assets/IMG/Ingredient Photos/Taco Sauce.png"),
        // Add more ingredients if needed
      ],
      steps: [
        StepBox(
            stepNumber: 1,
            description: "Cook the ground beef in a skillet until browned."),
        StepBox(
            stepNumber: 2, description: "Season the beef with taco seasoning."),
        StepBox(
            stepNumber: 3,
            description: "Warm the taco shells in the oven or microwave."),
        StepBox(
            stepNumber: 4,
            description: "Fill each taco shell with the seasoned beef."),
        StepBox(
            stepNumber: 5,
            description:
                "Top with shredded cheddar cheese, lettuce, and diced tomatoes."),
        StepBox(
            stepNumber: 6,
            description:
                "Finish with a dollop of sour cream and a drizzle of taco sauce."),
        // Add more steps if needed
      ],
    ),
    */
/*RecipeBox(
      id: 6,
      name: "Vegetable Stir-fry",
      description: "Healthy mix of stir-fried vegetables with soy sauce.",
      category: "Vegetarian",
      imageUrl: "assets/IMG/Recipe Photos/Vegetable Stir-fry.jpeg",
    ),
    RecipeBox(
      id: 7,
      name: "Butter Chicken",
      description: "Rich and creamy Indian curry with tender chicken pieces.",
      category: "Dinner",
      imageUrl: "assets/IMG/Recipe Photos/Butter Chicken.jpeg",
    ),
    RecipeBox(
      id: 8,
      name: "Grilled Salmon",
      description: "Perfectly grilled salmon with a hint of lemon and herbs.",
      category: "Dinner",
      imageUrl: "assets/IMG/Recipe Photos/Grilled Salmon.jpeg",
    ),
    RecipeBox(
      id: 9,
      name: "Cheeseburger",
      description: "Juicy beef patty with melted cheese and fresh toppings.",
      category: "Beef",
      imageUrl: "assets/IMG/Recipe Photos/Cheeseburger.jpeg",
    ),
    RecipeBox(
      id: 10,
      name: "Chocolate Brownie",
      description: "Decadent chocolate brownie with a fudgy center.",
      category: "Dessert",
      imageUrl: "assets/IMG/Recipe Photos/Chocolate Brownie.jpeg",
    ),
    RecipeBox(
      id: 11,
      name: "Greek Salad",
      description: "Fresh salad with feta cheese, olives, and cucumber.",
      category: "Lunch",
      imageUrl: "assets/IMG/Recipe Photos/Greek Salad.jpeg",
    ),
    RecipeBox(
      id: 12,
      name: "Pad Thai",
      description: "Classic Thai stir-fried noodles with shrimp and peanuts.",
      category: "Dinner",
      imageUrl: "assets/IMG/Recipe Photos/Pad Thai.jpeg",
    ),
    RecipeBox(
      id: 13,
      name: "Roast Chicken",
      description: "Golden roasted chicken with herbs and garlic.",
      category: "Dinner",
      imageUrl: "assets/IMG/Recipe Photos/Roast Chicken.jpeg",
    ),
    RecipeBox(
      id: 14,
      name: "Shrimp Scampi",
      description: "Garlic butter shrimp served with pasta.",
      category: "Dinner",
      imageUrl: "assets/IMG/Recipe Photos/Shrimp Scampi.jpeg",
    ),
    RecipeBox(
      id: 15,
      name: "Beef Stroganoff",
      description: "Creamy beef stroganoff served over egg noodles.",
      category: "Beef",
      imageUrl: "assets/IMG/Recipe Photos/Beef Stroganoff.jpeg",
    ),
    RecipeBox(
      id: 16,
      name: "Eggplant Parmesan",
      description: "Layers of breaded eggplant, marinara, and cheese.",
      category: "Vegetarian",
      imageUrl: "assets/IMG/Recipe Photos/Eggplant Parmesan.jpeg",
    ),
    RecipeBox(
      id: 17,
      name: "Chicken Tikka Masala",
      description: "Spiced chicken in a creamy tomato curry sauce.",
      category: "Dinner",
      imageUrl: "assets/IMG/Recipe Photos/Chicken Tikka Masala.jpeg",
    ),
    RecipeBox(
      id: 18,
      name: "Vegetable Soup",
      description: "Hearty soup with a mix of fresh vegetables.",
      category: "Lunch",
      imageUrl: "assets/IMG/Recipe Photos/Vegetable Soup.jpeg",
    ),
    RecipeBox(
      id: 19,
      name: "Mac and Cheese",
      description: "Classic comfort food with creamy cheese sauce.",
      category: "Lunch",
      imageUrl: "assets/IMG/Recipe Photos/Mac and Cheese.jpeg",
    ),
    RecipeBox(
      id: 20,
      name: "Apple Pie",
      description: "Traditional apple pie with a flaky crust.",
      category: "Dessert",
      imageUrl: "assets/IMG/Recipe Photos/Apple Pie.jpeg",
    ),*//*

    */
/*RecipeBox(
      id: 21,
      name: "Fish and Chips",
      description: "Crispy fried fish served with golden fries.",
      imageUrl: "assets/images/fish_and_chips.jpg",
    ),
    RecipeBox(
      id: 22,
      name: "Caprese Salad",
      description: "Simple salad with tomatoes, mozzarella, and basil.",
      imageUrl: "assets/images/caprese_salad.jpg",
    ),
    RecipeBox(
      id: 23,
      name: "Chocolate Chip Cookies",
      description: "Soft and chewy cookies with chocolate chips.",
      imageUrl: "assets/images/chocolate_chip_cookies.jpg",
    ),
    RecipeBox(
      id: 24,
      name: "Chicken Noodle Soup",
      description: "Warm soup with chicken, noodles, and vegetables.",
      imageUrl: "assets/images/chicken_noodle_soup.jpg",
    ),
    RecipeBox(
      id: 25,
      name: "Steak Fajitas",
      description: "Sizzling steak strips served with peppers and onions.",
      imageUrl: "assets/images/steak_fajitas.jpg",
    ),
    RecipeBox(
      id: 26,
      name: "Pancakes",
      description: "Fluffy pancakes topped with syrup and butter.",
      imageUrl: "assets/images/pancakes.jpg",
    ),
    RecipeBox(
      id: 27,
      name: "Lasagna",
      description: "Layers of pasta, meat sauce, and creamy cheese.",
      imageUrl: "assets/images/lasagna.jpg",
    ),
    RecipeBox(
      id: 28,
      name: "French Toast",
      description: "Golden-brown toast with cinnamon and syrup.",
      imageUrl: "assets/images/french_toast.jpg",
    ),
    RecipeBox(
      id: 29,
      name: "Stuffed Bell Peppers",
      description: "Bell peppers stuffed with rice and ground beef.",
      imageUrl: "assets/images/stuffed_bell_peppers.jpg",
    ),
    RecipeBox(
      id: 30,
      name: "Grilled Cheese Sandwich",
      description: "Crispy sandwich with melted cheese inside.",
      imageUrl: "assets/images/grilled_cheese.jpg",
    ),
    RecipeBox(
      id: 31,
      name: "Tomato Soup",
      description: "Creamy tomato soup with a hint of basil.",
      imageUrl: "assets/images/tomato_soup.jpg",
    ),
    RecipeBox(
      id: 32,
      name: "Fried Rice",
      description: "Savory rice stir-fried with vegetables and eggs.",
      imageUrl: "assets/images/fried_rice.jpg",
    ),
    RecipeBox(
      id: 33,
      name: "Margarita",
      description: "Refreshing cocktail with lime juice and tequila.",
      imageUrl: "assets/images/margarita.jpg",
    ),
    RecipeBox(
      id: 34,
      name: "Chocolate Cake",
      description: "Moist chocolate cake with creamy frosting.",
      imageUrl: "assets/images/chocolate_cake.jpg",
    ),
    RecipeBox(
      id: 35,
      name: "Spinach Quiche",
      description: "Savory pie with eggs, spinach, and cheese.",
      imageUrl: "assets/images/spinach_quiche.jpg",
    ),
    RecipeBox(
      id: 36,
      name: "Lentil Soup",
      description: "Healthy soup made with lentils and vegetables.",
      imageUrl: "assets/images/lentil_soup.jpg",
    ),
    RecipeBox(
      id: 37,
      name: "BBQ Ribs",
      description: "Slow-cooked ribs with a smoky BBQ sauce.",
      imageUrl: "assets/images/bbq_ribs.jpg",
    ),
    RecipeBox(
      id: 38,
      name: "Waffles",
      description: "Crispy waffles topped with fruits and syrup.",
      imageUrl: "assets/images/waffles.jpg",
    ),
    RecipeBox(
      id: 39,
      name: "Chicken Curry",
      description: "Spicy chicken curry with aromatic spices.",
      imageUrl: "assets/images/chicken_curry.jpg",
    ),
    RecipeBox(
      id: 40,
      name: "Veggie Burger",
      description: "Delicious burger with a plant-based patty.",
      imageUrl: "assets/images/veggie_burger.jpg",
    ),
    RecipeBox(
      id: 41,
      name: "Cinnamon Rolls",
      description: "Soft rolls filled with cinnamon and topped with icing.",
      imageUrl: "assets/images/cinnamon_rolls.jpg",
    ),
    RecipeBox(
      id: 42,
      name: "Shepherd's Pie",
      description: "Hearty pie with ground beef and mashed potatoes.",
      imageUrl: "assets/images/shepherds_pie.jpg",
    ),
    RecipeBox(
      id: 43,
      name: "Pumpkin Soup",
      description: "Creamy soup made with fresh pumpkin.",
      imageUrl: "assets/images/pumpkin_soup.jpg",
    ),
    RecipeBox(
      id: 44,
      name: "Stuffed Mushrooms",
      description: "Mushrooms filled with a savory breadcrumb mixture.",
      imageUrl: "assets/images/stuffed_mushrooms.jpg",
    ),
    RecipeBox(
      id: 45,
      name: "Chicken Wings",
      description: "Crispy and spicy chicken wings with dip.",
      imageUrl: "assets/images/chicken_wings.jpg",
    ),*//*

  ];
}
*/
