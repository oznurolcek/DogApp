import 'package:dog_app/core/init/navigation/navigation_service_interface.dart';
import 'package:flutter/material.dart';

class NavigationService extends INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  get removeAllOldRoutes => (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(String path, Object? data) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(String path, Object? data) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}