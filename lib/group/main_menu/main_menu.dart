import 'package:flutter/material.dart';
import 'package:pleng/group/components/discover_menu.dart';
import 'package:pleng/group/current_play/current_play.dart';
import 'package:pleng/group/headbar/head_bar.dart';
import 'package:pleng/group/home_page/all_home.dart';
import 'package:pleng/group/library/library.dart';
import 'package:pleng/group/search/search.dart';
import 'package:pleng/group/video/video.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _selectedIndex,
      children: [HomePage(),Search(), CurrentPlay(), Video(), Library()],
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/11.jpg'),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.video_library), label: 'Videos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_music), label: 'Library'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.tealAccent,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }
}
