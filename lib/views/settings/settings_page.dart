import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String osVersion = "Unknown";

  @override
  void initState() {
    super.initState();
    getOSVersion();
  }

  Future<void> getOSVersion() async {
    try {
      String version = await OSVersion.getOSVersion();
      setState(() {
        osVersion = version;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Hata: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            _buildCell(context, ImageConstants.instance.helpIcon, "Help"),
            _buildDivider(context),
            _buildCell(context, ImageConstants.instance.rateUsIcon, "Rate Us"),
            _buildDivider(context),
            _buildCell(context, ImageConstants.instance.shareIcon,
                "Share with Friends"),
            _buildDivider(context),
            _buildCell(
                context, ImageConstants.instance.termsIcon, "Terms of Use"),
            _buildDivider(context),
            _buildCell(
                context, ImageConstants.instance.privacyIcon, "Privacy Policy"),
            _buildDivider(context),
            _buildVersionCell(context),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildCell(BuildContext context, String icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: context.screenWidth * 0.03),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontFamily: 'GalanoGrotesque'),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_outward_rounded,
            color: Colors.grey.shade400,
            size: 16,
          ),
        ],
      ),
    );
  }

  Row _buildVersionCell(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageConstants.instance.versionIcon),
        SizedBox(width: context.screenWidth * 0.03),
        const Text(
          "OS Version",
          style: TextStyle(fontSize: 16, fontFamily: 'GalanoGrotesque'),
        ),
        const Spacer(),
        Text(
          osVersion,
          style: TextStyle(
              color: Colors.grey.shade400, fontFamily: 'GalanoGrotesque'),
        ),
      ],
    );
  }
}

Widget _buildDivider(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: context.screenHeight * 0.01),
      const Divider(thickness: 0.3),
    ],
  );
}

class OSVersion {
  static const platform = MethodChannel("com.example.dog_app/os_version");

  static Future<String> getOSVersion() async {
    try {
      return await platform.invokeMethod("getOSVersion");
    } on PlatformException catch (e) {
      return "Platform version not available: $e";
    }
  }
}
