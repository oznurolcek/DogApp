import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            buildHelpCell(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildRateUsCell(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildShareCell(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildTermsCell(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildPrivacyPolicyCell(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(thickness: 0.3),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildVersionCell(context),
          ],
        ),
      ),
    );
  }

  GestureDetector buildHelpCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          const Icon(Icons.info_outline),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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

  GestureDetector buildRateUsCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          const Icon(Icons.star_border_rounded),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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

  GestureDetector buildShareCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          const Icon(Icons.ios_share_outlined),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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

  GestureDetector buildTermsCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          const Icon(Icons.receipt_long_outlined),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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

  GestureDetector buildPrivacyPolicyCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          const Icon(Icons.verified_user_outlined),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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

  GestureDetector buildVersionCell(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          const Icon(Icons.account_tree_outlined),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          const Text(
            "OS Version",
            style: TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Text(
            "17.0.3",
            style: TextStyle(color: Colors.grey.shade400),
          )
        ],
      ),
    );
  }
}
