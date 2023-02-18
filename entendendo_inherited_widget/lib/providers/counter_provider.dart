import 'package:flutter/cupertino.dart';

//criar uma classe que vamos manipular apartir desse provider "CounterProvider"
class CounterState {
  int _value = 0;

  void inc() => _value++;
  void dec() => _value--;
  int get value => _value;
}

class CounterProvider extends InheritedWidget {
  final CounterState state = new CounterState();

  CounterProvider({required Widget child}) : super(child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
