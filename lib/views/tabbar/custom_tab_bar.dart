import 'package:dog_app/core/components/custom_clipper.dart';
import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/constants/navigation/navigation_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:dog_app/core/init/navigation/navigation_service.dart';
import 'package:dog_app/views/home/home_page.dart';
import 'package:dog_app/views/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int pageIndex = 0;
  final pages = [HomePage(), const SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: _buildTabBar(),
    );
  }

  Widget _buildTabBar() {
    return ClipPath(
      clipper: CustomTrapezoidClipper(),
      child: Container(
        height: context.screenHeight * 0.15,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? SvgPicture.asset(ImageConstants.instance.selectedHomeIcon)
                  : SvgPicture.asset(ImageConstants.instance.homeIcon)
            ),
            const VerticalDivider(width: 0, thickness: 0.8, indent: 30, endIndent: 50,),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                NavigationService.instance.navigateToPage(NavigationConstants.SETTINGS_VIEW, null);
              },
              icon: pageIndex == 1
                  ? SvgPicture.asset(ImageConstants.instance.selectedSettingsIcon)
                  : SvgPicture.asset(ImageConstants.instance.settingsIcon)
            )
          ],
        ),
      ),
    );
  }
}
