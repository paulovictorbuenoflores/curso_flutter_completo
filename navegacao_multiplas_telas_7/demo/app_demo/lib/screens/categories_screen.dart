import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vamos Cozinhar?')),
      body: GridView(
        /**Slive no flutter é uma area que tem scrow, grid delegate  seria uma forma de voce delegar como esse grid sera renderizada */
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              200, //cada elemento vai ter no maximo uma extensao de 200 pixel
          childAspectRatio: 3 /
              2, //qual vai ser a proporcao dentro de cada elemento do grid view
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        //nossos elementos filhos
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(cat);
        }).toList(),
      ),
    );
  }
}
