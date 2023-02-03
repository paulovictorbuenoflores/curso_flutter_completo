import 'package:app_demo/screens/categories_meals_screen.dart';
import 'package:app_demo/screens/meal_detail_screen.dart';
import 'package:app_demo/screens/settings_screen.dart';
import 'package:app_demo/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';

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
        //AppRoutes.HOME: ((ctx) => CategoriesScreen()),
        AppRoutes.HOME: ((ctx) => TabsScreen()),
        AppRoutes.CATEGORY_MEALS: ((ctx) => CategoriesMealsScreen()),
        AppRoutes.MEAL_DETAIL: ((ctx) => MealDetailScreen()),
        AppRoutes.SETTINGS: ((ctx) => SettingsScreen()),
      },
      //esse metodo é como o erro 404, quando nao acha a pagina retorna outra coisa no lugar, pra nao da erro
      onGenerateRoute: ((settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra_coisa') {
          return null;
        } else {
          return MaterialPageRoute(
            builder: (_) {
              return CategoriesScreen();
            },
          );
        }
      }),

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return CategoriesScreen();
          },
        );
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
