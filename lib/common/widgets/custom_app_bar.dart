import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../utils/router/router.dart';
import '../constants/constants.dart';

/// Custom AppBar displayes a menu and cart button.
/// [title] the title of the page.
///
class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Visibility(
            visible: context.router.canPop(),
            child: IconButton(
              onPressed: () => context.router.pop(),
              icon: const Icon(
                UniconsLine.angle_left_b,
                color: Constants.iconColor,
                size: Constants.iconSize,
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: Constants.titleStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Visibility(
            visible: context.router.current.name != CartRoute.name,
            child: IconButton(
              onPressed: () => context.router.push(const CartRoute()),
              icon: const Icon(
                UniconsLine.shopping_cart,
                color: Constants.iconColor,
                size: Constants.iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
