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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    icon: pageIndex == 0
                        ? SvgPicture.asset(
                            ImageConstants.instance.selectedHomeIcon)
                        : SvgPicture.asset(ImageConstants.instance.homeIcon)),
                Text(
                  "Home",
                  style: TextStyle(
                      color: pageIndex == 0
                          ? const Color(0xFF0054d3)
                          : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GalanoGrotesque'),
                )
              ],
            ),
            const VerticalDivider(
              width: 0,
              thickness: 0.8,
              indent: 40,
              endIndent: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      NavigationService.instance.presentModally(
                        context,
                        const SettingsPage(),
                      );
                    },
                    icon: pageIndex == 1
                        ? SvgPicture.asset(
                            ImageConstants.instance.selectedSettingsIcon)
                        : SvgPicture.asset(
                            ImageConstants.instance.settingsIcon)),
                Text(
                  "Settings",
                  style: TextStyle(
                      color: pageIndex == 1
                          ? const Color(0xFF0054d3)
                          : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GalanoGrotesque'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
