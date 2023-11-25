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
            _buildHelpCell(context),
            SizedBox(height: context.screenHeight * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: context.screenHeight * 0.01),
            _buildRateUsCell(context),
            SizedBox(height: context.screenHeight * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: context.screenHeight * 0.01),
            _buildShareCell(context),
            SizedBox(height: context.screenHeight * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: context.screenHeight * 0.01),
            _buildTermsCell(context),
            SizedBox(height: context.screenHeight * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: context.screenHeight * 0.01),
            _buildPrivacyPolicyCell(context),
            SizedBox(height: context.screenHeight * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: context.screenHeight * 0.01),
            _buildVersionCell(context),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildHelpCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SvgPicture.asset(ImageConstants.instance.helpIcon),
          SizedBox(width: context.screenWidth * 0.03),
          const Text(
            "Help",
            style: TextStyle(fontSize: 16, fontFamily: 'GalanoGrotesque'),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_outward_rounded,
            color: Colors.grey.shade400,
            size: 16,
          )
        ],
      ),
    );
  }

  GestureDetector _buildRateUsCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SvgPicture.asset(ImageConstants.instance.rateUsIcon),
          SizedBox(width: context.screenWidth * 0.03),
          const Text(
            "Rate Us",
            style: TextStyle(fontSize: 16, fontFamily: 'GalanoGrotesque'),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_outward_rounded,
            color: Colors.grey.shade400,
            size: 16,
          )
        ],
      ),
    );
  }

  GestureDetector _buildShareCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SvgPicture.asset(ImageConstants.instance.shareIcon),
          SizedBox(width: context.screenWidth * 0.03),
          const Text(
            "Share with Friends",
            style: TextStyle(fontSize: 16, fontFamily: 'GalanoGrotesque'),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_outward_rounded,
            color: Colors.grey.shade400,
            size: 16,
          )
        ],
      ),
    );
  }

  GestureDetector _buildTermsCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SvgPicture.asset(ImageConstants.instance.termsIcon),
          SizedBox(width: context.screenWidth * 0.03),
          const Text(
            "Terms of Use",
            style: TextStyle(fontSize: 16, fontFamily: 'GalanoGrotesque'),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_outward_rounded,
            color: Colors.grey.shade400,
            size: 16,
          )
        ],
      ),
    );
  }

  GestureDetector _buildPrivacyPolicyCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SvgPicture.asset(ImageConstants.instance.privacyIcon),
          SizedBox(width: context.screenWidth * 0.03),
          const Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 16, fontFamily: 'GalanoGrotesque'),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_outward_rounded,
            color: Colors.grey.shade400,
            size: 16,
          )
        ],
      ),
    );
  }

  GestureDetector _buildVersionCell(BuildContext context) {
    return GestureDetector(
      child: Row(
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
          )
        ],
      ),
    );
  }
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