
import 'package:flutter/material.dart';

Future<T?> goToScreen<T>(BuildContext context, Widget screen) async {
  return await Navigator.push<T>(
    context,
    MaterialPageRoute<T>(builder: (context) => screen),
  );
}

Future<T?> replaceScreen<T, T0>(BuildContext context, Widget screen) async {
  return await Navigator.pushReplacement<T, T0>(
    context,
    MaterialPageRoute<T>(builder: (context) => screen),
  );
}
