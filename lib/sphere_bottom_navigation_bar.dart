library sphere_bottom_navigation_bar;
import 'package:flutter/material.dart';
import 'package:sphere_bottom_navigation_bar/Model/build_navigation_item.dart';


class SphereBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedItem;
  final Color sheetBackgroundColor;
  final BorderRadius sheetRadius;
  final List<BuildNavigationItem> navigationItems;
  final ValueChanged<int> onItemPressed;
  final ValueChanged<int> onItemLongPressed;

  SphereBottomNavigationBar(
      {Key key,
        this.defaultSelectedItem,
        this.sheetBackgroundColor,
        this.sheetRadius,
        this.onItemLongPressed,
        @required this.navigationItems,
        @required this.onItemPressed}) {
    assert(onItemPressed != null,'You must implement onItemPressed ');
  }

  @override
  _SphereBottomNavigationBarState createState() {
    return _SphereBottomNavigationBarState(
        items: navigationItems,
        sheetRadius: sheetRadius,
        onItemLongPressed: onItemLongPressed,
        sheetBackgroundColor: sheetBackgroundColor,
        defaultSelectedItem: defaultSelectedItem,
        onItemPressed: onItemPressed);
  }
}

class _SphereBottomNavigationBarState extends State<SphereBottomNavigationBar> {
  final int defaultSelectedItem;
  List<BuildNavigationItem> items;
  int selectedItemIndex;
  BorderRadius sheetRadius;
  var sheetHieght;
  var sheetWidth;
  Color sheetBackgroundColor;
  ValueChanged<int> onItemLongPressed;
  ValueChanged<int> onItemPressed;

  _SphereBottomNavigationBarState(
      {@required this.items,
        this.onItemLongPressed,
        this.defaultSelectedItem = 0,
        this.sheetRadius,
        this.sheetBackgroundColor,
        //this.iconSize,
        @required this.onItemPressed}) {
    selectedItemIndex = defaultSelectedItem;
    assert(items.length > 1, 'Atleast 2 item required. ');
    assert(items.length <= 5, 'You can add Maximum 5 Item');
  }

  Widget ItemBuilder(BuildNavigationItem item, bool isSelected) {
    var containerHieght = ((sheetHieght + sheetWidth) / 8);
    var containerWidth = ((sheetHieght + sheetWidth) / 8);
    //print('Container hieght $containerHieght');
    //print('Container Width $containerWidth');
    var tooltip =
    item.tooltip == null ? selectedItemIndex.toString() : item.tooltip;
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Tooltip(
        verticalOffset: 50,
        message: '$tooltip',
        child: Container(
          width: containerWidth,
          height: containerHieght,
          decoration: BoxDecoration(
            color: isSelected
                ? item.selectedItemColor.withOpacity(1)
                : item.itemColor.withOpacity(0.4),
            borderRadius: BorderRadius.all(Radius.circular(150)),
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconTheme(
                      data: IconThemeData(
                          size: ((containerHieght + containerWidth) / 5),
                          color: isSelected
                              ? Colors.white
                              : item.itemColor == null
                              ? Colors.white
                              : item.itemColor),
                      child: item.icon,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    sheetHieght = MediaQuery.of(context).size.height / 10;
    sheetWidth = MediaQuery.of(context).size.width;
    sheetBackgroundColor = (sheetBackgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : sheetBackgroundColor;
    return Container(
      width: sheetWidth,
      height: sheetHieght,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(top: 6),
        width: sheetWidth,
        height: sheetHieght,
        decoration: BoxDecoration(
            color: sheetBackgroundColor,
            borderRadius: sheetRadius,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            var index = items.indexOf(item);
            return GestureDetector(
              onTap: () {
                onItemPressed(index);
                setState(() {
                  selectedItemIndex = index;
                });
              },
              onLongPress: () {
                onItemLongPressed(index);
                setState(() {
                  selectedItemIndex = index;
                });
              },
              child: ItemBuilder(item, selectedItemIndex == index),
            );
          }).toList(),
        ),
      ),
    );
  }
}
