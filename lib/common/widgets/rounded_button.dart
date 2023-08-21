import 'package:flutter/material.dart';

import '../constants/constants.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Color color, textColor;
  final VoidCallback? press;
  final bool loading;
  final IconData? icon;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.press,
    this.loading = false,
    this.icon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RoundedButtonState();
  }
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: widget.color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(context),
      ),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.loading ? null : widget.press,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        foregroundColor: widget.textColor,
        padding: const EdgeInsets.symmetric(horizontal: 40),
      ),
      child: widget.loading
          ? loadingWidget()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.icon != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      widget.icon,
                      color: widget.textColor,
                      size: Constants.iconSize,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Text(
                    widget.text,
                    selectionColor: widget.textColor,
                    style: Constants.buttonText,
                  ),
                ),
              ],
            ),
    );
  }

  Widget loadingWidget() {
    return SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.textColor,
        ),
      ),
    );
  }
}
