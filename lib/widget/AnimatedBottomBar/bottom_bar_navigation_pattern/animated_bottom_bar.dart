import 'package:flutter/material.dart';
import './BarItem.dart';
import './BarStyle.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;
  final BarStyle barStyle;

  const AnimatedBottomBar({
    super.key,
    required this.barItems,
    this.animationDuration = const Duration(milliseconds: 500),
    required this.onBarTap,
    required this.barStyle});

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16.0,
          top: 16.0,
          left: 5.0,
          right: 5.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> barItems = [];
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          duration: widget.animationDuration,
          decoration: BoxDecoration(
              color: isSelected
                  ? item.color.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius:const BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget>[
              Icon(
                item.iconData,
                color: isSelected ? item.color : Colors.black,
                size: widget.barStyle.iconSize,
              ),
              const SizedBox(
                width: 10.0,
              ),
              AnimatedSize(
                duration: widget.animationDuration,
                curve: Curves.easeInOut,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(
                      color: item.color,
                      fontWeight: widget.barStyle.fontWeight,
                      fontSize: widget.barStyle.fontSize),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return barItems;
  }
}
