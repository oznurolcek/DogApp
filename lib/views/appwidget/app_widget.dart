import 'package:dog_app/core/components/custom_clipper.dart';
import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:dog_app/core/init/navigation/navigation_service.dart';
import 'package:dog_app/models/dog.dart';
import 'package:dog_app/views/home/components/search_bar.dart';
import 'package:dog_app/views/home/home_page.dart';
import 'package:dog_app/views/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppWidget extends StatefulWidget {
  final List<Dog> dogList;
  final Map<String, String> dogsImageUrls;
  const AppWidget(
      {super.key, required this.dogList, required this.dogsImageUrls});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int pageIndex = 0;
  Widget getScreen() {
    if (pageIndex == 0) {
      return HomePage(
        dogList: widget.dogList,
        dogsImageUrls: widget.dogsImageUrls,
      );
    }
    return const SettingsPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: getScreen(),
          ),
          const SearchBarField(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: context.screenHeight * 0.15,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildTabBar(),
          ),
        ],
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTabItem(
              index: 0,
              icon: ImageConstants.instance.homeIcon,
              selectedIcon: ImageConstants.instance.selectedHomeIcon,
              label: "Home",
            ),
            const VerticalDivider(
              width: 0,
              thickness: 0.8,
              indent: 40,
              endIndent: 50,
            ),
            _buildTabItem(
              index: 1,
              icon: ImageConstants.instance.settingsIcon,
              selectedIcon: ImageConstants.instance.selectedSettingsIcon,
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required String icon,
    required String selectedIcon,
    required String label,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          enableFeedback: false,
          onPressed: () {
            if (index == 0) {
              setState(() {
                pageIndex = index;
              });
            } else {
              NavigationService.instance.presentModally(
                context,
                const SettingsPage(),
              );
            }
          },
          icon: pageIndex == index
              ? SvgPicture.asset(selectedIcon)
              : SvgPicture.asset(icon),
        ),
        Text(
          label,
          style: TextStyle(
            color: pageIndex == index ? const Color(0xFF0054d3) : Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'GalanoGrotesque',
          ),
        ),
      ],
    );
  }
}
