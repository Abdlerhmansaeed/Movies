import 'package:flutter/material.dart';

extension MediaQueryExtension on MediaQueryData {
  double get screenWidth => size.width;
  double get screenHeight => size.height;

  // Font size helpers
  double sp(double size) => size * textScaleFactor;
  double responsiveFont(double size) => size * (screenWidth / 375);
}

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // Font size helpers
  double sp(double size) => MediaQuery.of(this).sp(size);
  double responsiveFont(double size) =>
      MediaQuery.of(this).responsiveFont(size);

  // Predefined font sizes
  double get bodySmall => responsiveFont(12);
  double get bodyMedium => responsiveFont(14);
  double get bodyLarge => responsiveFont(16);
  double get titleSmall => responsiveFont(18);
  double get titleMedium => responsiveFont(20);
  double get titleLarge => responsiveFont(24);
  double get headlineSmall => responsiveFont(28);
  double get headlineMedium => responsiveFont(32);
  double get headlineLarge => responsiveFont(36);
}

extension NavigationExtension on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);

  Future<T?> pushReplacementNamed<T, TO>(String routeName,
          {Object? arguments}) =>
      Navigator.of(this)
          .pushReplacementNamed<T, TO>(routeName, arguments: arguments);

  void popUntil(String routeName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));
}
