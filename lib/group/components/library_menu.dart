import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class LibraryMenu extends StatefulWidget {
  final Function(int) onTabSelected;

  LibraryMenu({required this.onTabSelected});

  @override
  _LibraryMenuState createState() => _LibraryMenuState();
}

class _LibraryMenuState extends State<LibraryMenu> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    
    return Container(
      color: themeNotifier.isDarkMode ? Colors.grey[900] : Color(0xFFffffff),
      child: Row(
        children: [
          _buildTabItem(0, 'All'),
          _buildTabItem(1, 'Playlists'),
          _buildTabItem(2, 'Albums'),
          _buildTabItem(3, 'PodCast'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Expanded(
      child: TextButton(
        onPressed: () => _onTabSelected(index),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index
                ? (themeNotifier.isDarkMode ? Colors.white : Colors.black)
                : (themeNotifier.isDarkMode
                    ? Colors.white60
                    : const Color.fromARGB(255, 63, 63, 63)),
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: _selectedIndex == index
              ? (themeNotifier.isDarkMode
                  ? Colors.white24
                  : Color.fromARGB(57, 25, 25, 25))
              : Colors.transparent,
        ),
      ),
    );
  }
}
