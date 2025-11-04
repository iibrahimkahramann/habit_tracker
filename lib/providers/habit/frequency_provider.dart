import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Frequency { daily, weekly, monthly }

class FrequencyNotifier extends Notifier<Frequency> {
  @override
  Frequency build() {
    return Frequency.daily;
  }

  void setFrequency(Frequency newFrequency) {
    state = newFrequency;
  }
}

final frequencyProvider = NotifierProvider<FrequencyNotifier, Frequency>(() {
  return FrequencyNotifier();
});
