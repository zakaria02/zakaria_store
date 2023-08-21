import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'custom_app_bar.dart';

/// Custom Scaffold for all the screens.
/// [body] the content of the page.
/// [title] the text the display on the app bar
///
class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: title,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
