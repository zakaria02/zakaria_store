import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../constants/constants.dart';

class NetworkImageOrDefault extends StatelessWidget {
  const NetworkImageOrDefault({
    super.key,
    required this.imageUrl,
    this.icon = UniconsLine.image_slash,
    this.height,
    this.width,
  });
  final String imageUrl;
  final IconData icon;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          icon,
          size: Constants.iconSize,
        );
      },
    );
  }
}
