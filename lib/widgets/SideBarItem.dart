import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_clearance/providers/application.dart';

class SideBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String page;
  final Function() onTap;
  final Function(bool) onHover;
  const SideBarItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.page,
      required this.onTap,
      required this.onHover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Application app = Provider.of<Application>(context);
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      child: Container(
        color: page == app.activepage ? Colors.tealAccent : Colors.teal,
        child: ListTile(
          leading: Icon(
            icon,
            color: page == app.activepage ? Colors.black : Colors.white,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: page == app.activepage ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
