import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static const String route = "ProfileView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("profile"),
      ),
    );
  }
}
