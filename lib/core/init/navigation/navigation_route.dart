import 'package:dog_app/core/constants/navigation/navigation_constants.dart';
import 'package:dog_app/views/custom_tab_bar.dart';
import 'package:dog_app/views/home/home_page.dart';
import 'package:dog_app/views/settings_page.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT_VIEW:
        return normalNavigate(const CustomTabBar());
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomePage());
      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(const SettingsPage());
      default:
        return MaterialPageRoute(
          builder: (context) => const Center(child: Text("Not Found Page")),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
