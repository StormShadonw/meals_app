import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          "You have no favorites yet - start adding some!",
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            title: widget.favoriteMeals[index].title,
            duration: widget.favoriteMeals[index].duration,
            affordability: widget.favoriteMeals[index].affordability,
            complexity: widget.favoriteMeals[index].complexity,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
