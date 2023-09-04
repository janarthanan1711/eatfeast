import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal_model.dart';
class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onSelectItem});

  final Meal meal;
  final void Function( BuildContext context, Meal meal) onSelectItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          onSelectItem(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 45),
                  child: Column(
                   children: [
                     Text(
                       meal.title,
                       maxLines: 2,
                       textAlign: TextAlign.center,
                       softWrap: true,
                       overflow: TextOverflow.ellipsis,
                       style: const TextStyle(
                         fontSize: 21,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                       ),
                     ),

                   ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
