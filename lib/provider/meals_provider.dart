import 'package:eatfeast/data/category_dummy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref){
  return dummyMeals;
});
