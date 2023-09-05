import 'package:flutter/material.dart';

appBar(title) {
  return AppBar(
    title: Text(title, style: const TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w900,
      shadows: [
        Shadow(
          offset: Offset(2, 2),
          blurRadius: 2,
        ),
        // You can add as many Shadow as you want
        Shadow(/*...*/),
      ],
    )),
  );
}
