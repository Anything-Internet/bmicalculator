import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final String tooltip;
  final Color? borderColor;
  final Color? fillColor;

  const RoundIconButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip = "",
    this.borderColor,
    this.fillColor
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: fillColor ?? Theme.of(context).floatingActionButtonTheme.backgroundColor,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: child,
      elevation: 6.0,
      disabledElevation: 6.0,
      shape:  CircleBorder(
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
