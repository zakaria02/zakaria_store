import 'package:flutter/material.dart';

import '../constants/constants.dart';

/// Displays the price in a yellow container
/// [price] is the price to display
class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        "${price.toStringAsFixed(2)} ${Constants.currency}",
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
