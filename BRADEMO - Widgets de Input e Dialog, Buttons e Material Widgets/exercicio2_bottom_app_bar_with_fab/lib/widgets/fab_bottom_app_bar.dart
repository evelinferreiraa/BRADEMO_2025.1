import 'package:flutter/material.dart';
import 'fab_bottom_app_bar_item.dart';

class FABBottomAppBar extends StatelessWidget {
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final int selectedIndex;

  const FABBottomAppBar({
    super.key,
    required this.items,
    required this.centerItemText,
    required this.height,
    required this.iconSize,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
    required this.selectedIndex,
  }) : assert(items.length == 2 || items.length == 4);

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = List.generate(items.length, (index) {
      return _buildTabItem(item: items[index], index: index);
    });

    tabs.insert(tabs.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: notchedShape,
      color: Colors.white,
      elevation: 8, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: iconSize),
            Text(centerItemText, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
  }) {
    Color currentColor = selectedIndex == index ? selectedColor : color;

    return Expanded(
      child: InkWell(
        onTap: () => onTabSelected(index),
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.iconData, color: currentColor, size: iconSize),
              Text(item.text, style: TextStyle(color: currentColor)),
            ],
          ),
        ),
      ),
    );
  }
}
