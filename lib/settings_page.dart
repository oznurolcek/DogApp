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

  Row buildHelpCell(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.info_outline),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        const Text(
          "Help",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.66),
        Icon(
          Icons.arrow_outward_rounded,
          color: Colors.grey.shade400,
          size: 16,
        )
      ],
    );
  }

  Row buildRateUsCell(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_border_rounded),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        const Text(
          "Rate Us",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.6),
        Icon(
          Icons.arrow_outward_rounded,
          color: Colors.grey.shade400,
          size: 16,
        )
      ],
    );
  }

  Row buildShareCell(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.ios_share_outlined),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        const Text(
          "Share with Friends",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.38),
        Icon(
          Icons.arrow_outward_rounded,
          color: Colors.grey.shade400,
          size: 16,
        )
      ],
    );
  }

  Row buildTermsCell(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.receipt_long_outlined),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        const Text(
          "Terms of Use",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.48),
        Icon(
          Icons.arrow_outward_rounded,
          color: Colors.grey.shade400,
          size: 16,
        )
      ],
    );
  }

  Row buildPrivacyPolicyCell(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.verified_user_outlined),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        const Text(
          "Privacy Policy",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.46),
        Icon(
          Icons.arrow_outward_rounded,
          color: Colors.grey.shade400,
          size: 16,
        )
      ],
    );
  }

  Row buildVersionCell(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.account_tree_outlined),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        const Text(
          "OS Version",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.45),
        Text(
          "17.0.3",
          style: TextStyle(color: Colors.grey.shade400),
        )
      ],
    );
  }
}
