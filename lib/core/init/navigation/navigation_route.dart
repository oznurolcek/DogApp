import 'package:dog_app/core/constants/navigation/navigation_constants.dart';
import 'package:dog_app/views/splash/splash_screen.dart';
import 'package:dog_app/views/appwidget/app_widget.dart';
import 'package:dog_app/views/home/home_page.dart';
import 'package:dog_app/views/settings/settings_page.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT_VIEW:
        return normalNavigate(const SplashScreen());
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(const HomePage(dogList: [], dogsImageUrls: {},));
      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(const SettingsPage());
      case NavigationConstants.CUSTOM_TAB_BAR:
        return normalNavigate(const AppWidget(dogList: [], dogsImageUrls: {},));
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
