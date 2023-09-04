import 'package:eatfeast/data/category_dummy.dart';
import 'package:eatfeast/screens/meals.dart';
import 'package:eatfeast/widgets/grid_category_item.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal_model.dart';
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _chooseCategory(BuildContext context, Category category){
   final filteredMeals = availableMeals.where((meals) => meals.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        children: [
          for(var categories in availableCategories)
            GridCategoryItem(category: categories,onSelectCategory: (){
              _chooseCategory(context,categories);
            },)
        ],

    );
  }
}
