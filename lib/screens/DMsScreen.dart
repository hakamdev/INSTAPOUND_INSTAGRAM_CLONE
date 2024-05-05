import 'package:flutter/material.dart';

class DMsScreens extends StatefulWidget {
  const DMsScreens({super.key});

  @override
  State<DMsScreens> createState() => _DMsScreensState();
}

class _DMsScreensState extends State<DMsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepPurple,
        alignment: Alignment.center,
        child: Text(
          "DMs",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
