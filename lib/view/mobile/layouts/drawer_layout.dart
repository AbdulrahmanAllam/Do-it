import 'package:do_it_flutter/view/mobile/category/categoryies_list_view.dart';
import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CategoriesListView.route);
              },
              child: Text("categories"),
            ),
            Text("Sign Out"),
          ],
        ),
      ),
    );
  }
}
