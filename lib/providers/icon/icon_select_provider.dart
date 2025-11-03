import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/constants/icons.dart';

class IconNotifier extends Notifier<String> {
  @override
  String build() {
    return icons.first;
  }

  void updateIcon(String icon) {
    state = icon;
  }
}

final iconProvider = NotifierProvider<IconNotifier, String>(() {
  return IconNotifier();
});
