import 'package:flutter/material.dart';

class SideBarItem extends StatelessWidget {
  final Function onHover;
  final String title;
  final IconData icon;
  final int index;
  const SideBarItem(
      {Key? key,
      required this.onHover,
      required this.title,
      required this.icon,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onHover: (value) => onHover.call(value),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
