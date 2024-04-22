import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/qty.dart';

class QuantityNotifier extends StateNotifier<int> {
  QuantityNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 0) {
      state--;
    }
  }
}

// Create a state provider for the quantity of each item
final quantityProviders = StateNotifierProvider<QuantityNotifier, int>((ref)=>QuantityNotifier());