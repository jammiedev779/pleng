import 'package:flutter/material.dart';

class DiscoverMenu extends StatefulWidget {
  @override
  _DiscoverMenuState createState() => _DiscoverMenuState();
}

class _DiscoverMenuState extends State<DiscoverMenu> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(48.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  // Handle onPressed event here
                },
                child: Text('All', style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white24,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                // Handle onPressed event here
              },
              child:
                  Text('Music Charts', style: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                // Handle onPressed event here
              },
              child: Text('Discover Playlists',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
