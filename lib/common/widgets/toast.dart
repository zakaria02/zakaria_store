import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:unicons/unicons.dart';

abstract class _Toast extends StatelessWidget {
  const _Toast({
    super.key,
    required this.controller,
    required this.icon,
    required this.title,
    required this.message,
    required this.color,
  });

  final FlashController controller;
  final IconData icon;
  final String title;
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 350,
          child: FlashBar(
            controller: controller,
            forwardAnimationCurve: Curves.easeInCirc,
            reverseAnimationCurve: Curves.bounceIn,
            behavior: FlashBehavior.floating,
            position: FlashPosition.bottom,
            indicatorColor: color,
            icon: Icon(
              icon,
              color: color,
            ),
            title: Text(title),
            content: Text(message),
            margin: const EdgeInsets.all(20.0),
            actions: [
              TextButton(
                onPressed: () => controller.dismiss(true),
                child: const Text('Ok'),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SuccessToast extends _Toast {
  const SuccessToast({
    super.key,
    required super.controller,
    super.icon = UniconsLine.check_circle,
    required super.title,
    required super.message,
    super.color = Colors.green,
  });
}

class ErrorToast extends _Toast {
  const ErrorToast({
    super.key,
    required super.controller,
    super.icon = UniconsLine.exclamation_circle,
    required super.title,
    required super.message,
    super.color = Colors.redAccent,
  });
}

class InformationToast extends _Toast {
  const InformationToast({
    super.key,
    required super.controller,
    super.icon = UniconsLine.exclamation_octagon,
    required super.title,
    required super.message,
    super.color = Colors.blue,
  });
}

class WarningToast extends _Toast {
  const WarningToast({
    super.key,
    required super.controller,
    super.icon = UniconsLine.exclamation_triangle,
    required super.title,
    required super.message,
    super.color = Colors.orange,
  });
}
