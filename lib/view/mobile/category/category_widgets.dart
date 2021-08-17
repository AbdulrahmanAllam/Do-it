import 'dart:math';
import 'package:do_it_flutter/view/mobile/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidgets {
  Widget categoryItem() {
    return CustomItemWidget(
      text: "Category",
      iconColor: Color(Random().nextInt(0xffffffff)),
      deleteItem: () {},
      onTap: () {},
    );
  }
}
