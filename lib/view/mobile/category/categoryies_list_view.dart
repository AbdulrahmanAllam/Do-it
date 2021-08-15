import 'package:do_it_flutter/utils/widgets/custom_app_bar.dart';
import 'package:do_it_flutter/view/mobile/category/category_widgets.dart';
import 'package:do_it_flutter/view_mode/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesListView extends StatelessWidget {
  static const String route = "CategoriesListView";
  @override
  Widget build(BuildContext context) {
    CategoryWidgets _categoryWidgets = CategoryWidgets();
    return ChangeNotifierProvider<CategoryViewModel>(
      create: (context) => CategoryViewModel(),
      child: Scaffold(
        appBar: customAppBar(title: "Categories"),
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) => _categoryWidgets.categoryItem(),
        ),
      ),
    );
  }
}
