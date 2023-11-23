import 'dart:io';

import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
          SizedBox(width: context.screenWidth * 0.02),
          const Text(
            "Help",
            style: TextStyle(fontSize: 16),
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
          SizedBox(width: context.screenWidth * 0.02),
          const Text(
            "Rate Us",
            style: TextStyle(fontSize: 16),
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
          SizedBox(width: context.screenWidth * 0.02),
          const Text(
            "Share with Friends",
            style: TextStyle(fontSize: 16),
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
          SizedBox(width: context.screenWidth * 0.02),
          const Text(
            "Terms of Use",
            style: TextStyle(fontSize: 16),
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
          SizedBox(width: context.screenWidth * 0.02),
          const Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 16),
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
          SizedBox(width: context.screenWidth * 0.02),
          Text(
            Platform.isIOS ? "OS Version" : "Android Version",
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Text(
            Platform.operatingSystemVersion,
            style: TextStyle(color: Colors.grey.shade400),
          )
        ],
      ),
    );
  }
}
