library sphere_bottom_navigation_bar;
import 'package:flutter/material.dart';

class BuildNavigationItem {
  final Icon icon;
  final Color selectedItemColor;
  final Color itemColor;
  final String tooltip;
  BuildNavigationItem(
      {@required this.icon,
        @required this.tooltip,
        this.selectedItemColor = Colors.blue,
        this.itemColor}) {
    assert(icon != null);
  }
}