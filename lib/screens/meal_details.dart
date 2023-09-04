import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal_model.dart';
import 'package:eatfeast/provider/favorites_provider.dart';
class MealDetails extends ConsumerWidget {
  const MealDetails({super.key,required this.meal});
  
  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
          final wasAdded = ref
                .read(favoriteMealsProvider.notifier)
                .toggleMealFavoriteStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(wasAdded ? 'Meal Added as Favorite' : 'Meal Removed')));
          }, icon: const Icon(Icons.favorite))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,),
            const SizedBox(height: 14,),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 14,),
            for(var ingredients in meal.ingredients)
              Text(ingredients,  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
              ),
              ),
            SizedBox(height: 20,),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 14,),
            for(var steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                child: Text(steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),),
              )


          ],
        ),
      ),
    );
  }
}
