import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dotty/dotty.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DottyColors', () {
    test('has correct background color', () {
      expect(DottyColors.background, const Color(0xFF0a0c0f));
    });

    test('has correct accent color', () {
      expect(DottyColors.accent, const Color(0xFF00e5a0));
    });
  });

  group('DottyThemeData', () {
    test('creates dark theme', () {
      final theme = DottyThemeData.dark();
      expect(theme.toThemeData().brightness, Brightness.dark);
    });
  });
}
