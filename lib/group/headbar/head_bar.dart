import 'package:flutter/material.dart';


class HeadBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onLanguageToggle;
  final bool isKhmer;
   HeadBar({required this.onLanguageToggle, required this.isKhmer});
  @override
  _HeadBarState createState() => _HeadBarState();

  @override
  Size get preferredSize => Size.fromHeight(69.0);
}

class _HeadBarState extends State<HeadBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1f1f1f),
      title: Text("Pleng",
      style: TextStyle(
        fontSize: 40,
        color: const Color(0xFF00994c)
      ),),
      actions: [
        Icon(Icons.notifications_none, color: Colors.white),
        IconButton(
          icon: Icon(Icons.language, color: Colors.white),
          onPressed: widget.onLanguageToggle,
        ),
        CircleAvatar(
          backgroundColor: Color(0xFF363636),
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

