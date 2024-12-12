import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeColors {
  static const Color primaryColor = Colors.teal;
  static const Color secondaryColor = Colors.amber;
  static const Color shadowColor = Colors.white30;
  static const Color warningColor = Colors.red;
  static const Color backgroundColor = Color.fromRGBO(118, 219, 209, 1);
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}

enum FontSize { small, medium, large }

class FontState {
  final double fontSize;
  FontState({required this.fontSize});
}

final fontStateProvider =
    StateNotifierProvider<FontStateNotifier, FontState>((ref) {
  return FontStateNotifier();
});

class FontStateNotifier extends StateNotifier<FontState> {
  FontStateNotifier() : super(FontState(fontSize: 16.0));
  void setFontSize(double size) {
    state = FontState(fontSize: size);
  }
}

/*




*/
