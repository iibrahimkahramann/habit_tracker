import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorNotifier extends Notifier<Color> {
  @override
  Color build() {
    return Colors.red;
  }

  void updateColor(Color color) {
    state = color;
  }
}

final colorProvider = NotifierProvider<ColorNotifier, Color>(() {
  return ColorNotifier();
});

const List<Color> appColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.amber,
  Colors.brown,
  Colors.deepOrange,
  Colors.lime,
  Colors.lightGreen,
  Colors.lightBlue,
  Colors.deepPurple,
  Colors.blueGrey,
  Colors.grey,
  Colors.black,
  Colors.indigoAccent,
  Colors.purpleAccent,
  Colors.greenAccent,
  Colors.redAccent,
];

final Map<Color, String> appColorNames = {
  Colors.red: 'Red',
  Colors.orange: 'Orange',
  Colors.yellow: 'Yellow',
  Colors.green: 'Green',
  Colors.blue: 'Blue',
  Colors.indigo: 'Indigo',
  Colors.purple: 'Purple',
  Colors.pink: 'Pink',
  Colors.teal: 'Teal',
  Colors.cyan: 'Cyan',
  Colors.amber: 'Amber',
  Colors.brown: 'Brown',
  Colors.deepOrange: 'Deep Orange',
  Colors.lime: 'Lime',
  Colors.lightGreen: 'Light Green',
  Colors.lightBlue: 'Light Blue',
  Colors.deepPurple: 'Deep Purple',
  Colors.blueGrey: 'Blue Grey',
  Colors.grey: 'Grey',
  Colors.black: 'Black',
  Colors.indigoAccent: 'Indigo Accent',
  Colors.purpleAccent: 'Purple Accent',
  Colors.greenAccent: 'Green Accent',
  Colors.redAccent: 'Red Accent',
};
