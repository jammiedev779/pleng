import 'package:flutter/material.dart';

class HeadBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HeadBarState createState() => _HeadBarState();

  @override
  Size get preferredSize => Size.fromHeight(69.0); // Adjust height as needed
}

class _HeadBarState extends State<HeadBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text('Pleng',
          style: TextStyle(color: Colors.tealAccent, fontSize: 24)),
      actions: [
        Icon(Icons.notifications_none, color: Colors.white),
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
