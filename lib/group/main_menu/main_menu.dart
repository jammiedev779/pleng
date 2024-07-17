import 'package:flutter/material.dart';
import 'package:pleng/group/current_play/current_play_data.dart';
import 'package:pleng/group/home_page/all_home.dart';
import 'package:pleng/group/library/library.dart';
import 'package:pleng/group/search/search.dart';
import 'package:pleng/group/video/video.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class MainMenu extends StatefulWidget {
  final bool isKhmer;
  final VoidCallback toggleLanguage;

  MainMenu({required this.isKhmer, required this.toggleLanguage});

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
   
      children: [
        HomePage(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
        Search(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
        CurrentPlayData(),
        Video(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
        Library(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
      ],
    );
  }

  Widget _buildBottomNav() {
    final themeNotifier = context.watch<ThemeNotifier>();
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: widget.isKhmer ? 'ទាំងអស់' : 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: widget.isKhmer ? 'ស្វែងរក' : 'Search'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/11.jpg'),
          ),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.video_library), label: widget.isKhmer ? 'វីដេអូ' : 'Videos'),
        BottomNavigationBarItem(icon: Icon(Icons.library_music), label: widget.isKhmer ? 'បណ្ណាល័យ' : 'Library'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: themeNotifier.isDarkMode ? const Color(0xFFffffff) : const Color(0xFF1f1f1f),
      unselectedItemColor: const Color.fromARGB(255, 132, 132, 132),
      backgroundColor: themeNotifier.isDarkMode ? Color(0xFF323232) : Color(0xFFffffff),
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }
}
