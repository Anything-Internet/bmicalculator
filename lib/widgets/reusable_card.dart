import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color defColor = const Color(0xFF252536);
  final String position; // left, right, center, wide - to affect margins
  final Color? color;
  final Widget? child;
  final Function? callback;

   const ReusableCard(
      {super.key,
        this.color,
        this.child,
        this.callback,
        this.position = "wide"});

  @override
  Widget build(BuildContext context) {
    const double defMargin = 10;
    const double defHalfMargin = defMargin / 2;
    late EdgeInsetsGeometry? margin;

    if (position == "left") {
      margin = const EdgeInsets.fromLTRB(
          defMargin, defHalfMargin, defHalfMargin, defHalfMargin);
    }
    if (position == "right") {
      margin = const EdgeInsets.fromLTRB(
          defHalfMargin, defHalfMargin, defMargin, defHalfMargin);
    }
    if (position == "center") {
      margin = const EdgeInsets.fromLTRB(
          defHalfMargin, defHalfMargin, defHalfMargin, defHalfMargin);
    }
    if (position == "wide") {
      margin = const EdgeInsets.fromLTRB(
          defMargin, defHalfMargin, defMargin, defHalfMargin);
    }

    return GestureDetector(
      child: Container(
        margin: margin,
        width: double.infinity,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color ?? defColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey.shade800,
            width: 2,
          ),
        ),
        child: child ?? const Text("Empty Box"),
      ),
      onTap: () {
        if (callback != null) {
          callback!();
        }
      },
    );
  }
}
