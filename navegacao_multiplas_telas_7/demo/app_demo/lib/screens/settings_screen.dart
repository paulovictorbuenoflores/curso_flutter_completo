import 'package:app_demo/components/main_drawer.dart';
import 'package:app_demo/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsScreen extends StatefulWidget {
//sempre que ouver uma mudancao nas configuracoes essa funcao notificara o myApp
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glutén!',
                    settings!.isGlutenFree,
                    (value) => setState(() => settings!.isGlutenFree = value)),
                _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem Lactose!',
                    settings!.isLactoseFree,
                    (value) => setState(() => settings!.isLactoseFree = value)),
                _createSwitch(
                    'Vegana',
                    'Só exibe refeições Veganas!',
                    settings!.isVegan,
                    (value) => setState(() => settings!.isVegan = value)),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições Vegetariana!',
                    settings!.isVegetarian,
                    (value) => setState(() => settings!.isVegetarian = value)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
