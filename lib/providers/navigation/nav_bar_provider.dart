import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifier extends Notifier<int> {
  @override
  int build() {
    // Başlangıç değerini (state) belirle
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

final navBarProvider = NotifierProvider<NavBarNotifier, int>(
  () => NavBarNotifier(),
);
