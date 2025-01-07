import 'package:flutter/material.dart';
import 'package:recipe_book_app/widgets/CustomButton.dart';
import 'package:recipe_book_app/widgets/CustomTextField.dart';

class AddRecipeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20,
        // bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'Recipe Name',
                  labelColor: Colors.black,
                  labelFontWeight: FontWeight.bold,
                  hintText: 'Ex: Traditional spare ribs baked',
                ),
              ),
              SizedBox(width: 10),
              CustomButton(
                onPressed: () {},
                title: 'Upload Photo',
                titleColor: Colors.white,
                titleSize: 20,
                height: 55,
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomTextField(
            label: 'Recipe Description',
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
            hintText: '....??',
            maxLines: 5,
          ),
          SizedBox(height: 10),
          CustomTextField(
            label: 'Recipe Ingredients',
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
            hintText: '....??',
            maxLines: 5,
          ),
          SizedBox(height: 10),
          CustomTextField(
            label: 'Recipe Steps',
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
            hintText: '....??',
            maxLines: 5,
          ),
          SizedBox(height: 10),
          CustomButton(
            onPressed: () {},
            title: 'Add',
            titleColor: Colors.white,
            titleSize: 20,
            height: 55,
            buttonColor: Color(0xFFF4B855),
          ),
        ],
      ),
    );
  }
}
