// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pleng/group/components/library_menu.dart';
import 'package:pleng/group/headbar/head_bar.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  int _selectedTabIndex = 0;
  bool _isKhmer = false;
  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _toggleLanguage() {
    setState(() {
      _isKhmer = !_isKhmer;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Scaffold(
      appBar: HeadBar(onLanguageToggle: _toggleLanguage, isKhmer: _isKhmer),
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.grey[900] : Color(0xFFffffff),
        child: Column(
          children: [
            LibraryMenu(onTabSelected: _onTabSelected),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (_selectedTabIndex == 0) _buildAll(),
                    if (_selectedTabIndex == 1) _buildPlaylist(),
                    if (_selectedTabIndex == 2) _buildAlbums(),
                    if (_selectedTabIndex == 3) _buildPodCast(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAll() {
    return _buildContent();
  }

  Widget _buildPlaylist() {
    return _buildContent();
  }

  Widget _buildAlbums() {
    return _buildContent();
  }

  Widget _buildPodCast() {
    return _buildContent();
  }

  Widget _buildContent() {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: themeNotifier.isDarkMode
                    ? Colors.grey[850]
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.add,
                    size: 40.0,
                    color:
                        themeNotifier.isDarkMode ? Colors.white : Colors.black,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Create a playlist',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: themeNotifier.isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.0),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  Icons.headset,
                  size: 100.0,
                  color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Nothing has been Added',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: themeNotifier.isDarkMode
                        ? Colors.white
                        : Colors.black, // Adjust the color as needed
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Browse songs, playlists, podcasts and albums to add to your favourites',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: themeNotifier.isDarkMode
                        ? Colors.white
                        : Colors.black, // Adjust the color as needed
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Action for exploring
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  ),
                  child: Text('Explore Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
