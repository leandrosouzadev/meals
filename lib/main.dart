import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    _availableMeals = dummyMeals.where((meal) {
      final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
      final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
      final filterVegan = settings.isVegan && !meal.isVegan;
      final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

      return !filterGluten &&
          !filterLactose &&
          !filterVegan &&
          !filterVegetarian;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      fontFamily: 'Raleway',
    );

    return MaterialApp(
      title: 'Vamos Cozinhar?',
      debugShowCheckedModeBanner: false,
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        //textTheme: ThemeData.light().textTheme.copyWith(
        textTheme: themeData.textTheme.copyWith(
          titleLarge: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      routes: {
        AppRoutes.home: (ctx) => const TabsScreen(),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(),
        AppRoutes.settings: (context) => SettingsScreen(_filterMeals),
      },
    );
  }
}
