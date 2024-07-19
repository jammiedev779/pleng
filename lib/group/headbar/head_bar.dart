import 'package:flutter/material.dart';
import 'package:pleng/group/developer/display_user.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

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
    final themeNotifier = context.watch<ThemeNotifier>();

    return AppBar(
      backgroundColor:
          themeNotifier.isDarkMode ? Color(0xFF1f1f1f) : Colors.white,
      title: Text(
        "Pleng",
        style: TextStyle(fontSize: 40, color: const Color(0xFF00994c)),
      ),
      actions: [
        Icon(Icons.notifications_none,
            color: themeNotifier.isDarkMode ? Colors.white : Colors.black),
        IconButton(
          icon: themeNotifier.isDarkMode
              ? Icon(Icons.language, color: Colors.white)
              : Icon(Icons.language, color: Colors.black),
          onPressed: widget.onLanguageToggle,
        ),
        IconButton(
          icon: themeNotifier.isDarkMode
              ? Icon(Icons.dark_mode, color: Colors.white)
              : Icon(Icons.light_mode, color: Colors.black),
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        ),
        CircleAvatar(
          backgroundColor: Color(0xFF363636),
          child: IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DisplayUser()),
              );
            },
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
