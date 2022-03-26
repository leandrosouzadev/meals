import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const CategoriesScreen(),
      routes: {
        '/categories-meals': (ctx) => const CategoriesMealsScreen(),
      },
    );
  }
}
