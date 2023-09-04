import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfeast/screens/categories.dart';
import 'package:eatfeast/screens/filters.dart';
import 'package:eatfeast/screens/meals.dart';
import 'package:flutter/material.dart';
import '../provider/filter_provider.dart';
import '../widgets/main_drawer.dart';
import 'package:eatfeast/provider/favorites_provider.dart';


Map<Filter,bool> kInitialFilters = {
  Filter.glutenFree:false,
  Filter.vegetarian:false,
  Filter.lactoseFree:false,
  Filter.vegan:false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _setScreen(String id) async {
    Navigator.of(context).pop();
    if (id == 'filters') {
 await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder: (ctx) =>const  FilterScreen(),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

     final availableMeals = ref.watch(filteredMealsProvider);

    Widget active = CategoriesPage(

      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      active = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: active,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
    );
  }
}
