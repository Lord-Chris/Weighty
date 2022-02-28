import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService? _navigationService;

  static NavigationService get instance {
    _navigationService ??= NavigationService();
    return _navigationService!;
  }

  static final navigatorKey = GlobalKey<NavigatorState>();

  Future<T?>? toNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?>? offNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?>? offAllNamed<T extends Object?>(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void back<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }
}
