import 'package:flutter/material.dart';

class DiscoverMenu extends StatefulWidget {
  final Function(int) onTabSelected;

  DiscoverMenu({required this.onTabSelected});

  @override
  _DiscoverMenuState createState() => _DiscoverMenuState();
}

class _DiscoverMenuState extends State<DiscoverMenu> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Row(
        children: [
          _buildTabItem(0, 'All'),
          _buildTabItem(1, 'Music Charts'),
          _buildTabItem(2, 'Discover Playlists'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    return Expanded(
      child: TextButton(
        onPressed: () => _onTabSelected(index),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.white : Colors.white60,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: _selectedIndex == index ? Colors.white24 : Colors.transparent,
        ),
      ),
    );
  }
}
