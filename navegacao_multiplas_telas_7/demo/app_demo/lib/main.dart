import 'package:app_demo/screens/categories_meals_screen.dart';
import 'package:app_demo/screens/meal_detail_screen.dart';
import 'package:app_demo/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './screens/categories_screen.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium:
                  TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      // home: MyHomePage(),
      // home: CategoriesScreen(),
      routes: {
        AppRoutes.HOME: ((ctx) => CategoriesScreen()),
        AppRoutes.CATEGORY_MEALS: ((ctx) => CategoriesMealsScreen()),
        AppRoutes.MEAL_DETAIL: ((ctx) => MealDetailScreen()),
      },
    );
  }
}

//componente stateful  MyHomePage
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//gerencia o estado do componente stateful MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Cozinhar?'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
