import 'package:flutter/material.dart';

class DiscoverPlaylistsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Playlists'),
        actions: [
          Icon(Icons.notifications_none),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Center(child: Text('Discover Playlists Page Content')),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/11.jpg')), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Videos'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
        ],
      ),
    );
  }
}
