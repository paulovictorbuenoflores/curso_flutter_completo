import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_form_sceen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class WidgetApp extends StatelessWidget {
  const WidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => GreatPlaces())),
      ],
      child: MaterialApp(
        title: 'My app',
        theme: ThemeData(
            primaryColor: Colors.indigo,
            accentColor: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
