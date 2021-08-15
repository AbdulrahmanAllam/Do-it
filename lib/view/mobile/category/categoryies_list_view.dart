import 'package:do_it_flutter/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  static const String route = "CategoriesListView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Categories"),
      body: Center(
        child: Text("HI"),
      ),
    );
  }
}
