import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';
import '../utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);
  void _selectCategory(BuildContext context) {
    /*Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen(category);
        },
      ),
    );*/

    Navigator.of(context).pushNamed(
      //chamada de uma rota nomeada
      AppRoutes.CATEGORY_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              //definir de onde vai comecar fazer o gradiente
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
