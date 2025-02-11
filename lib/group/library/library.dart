import 'package:flutter/material.dart';
import 'package:pleng/group/components/library_menu.dart';
import 'package:pleng/group/headbar/head_bar.dart';
import 'package:pleng/provider/theme_notifier.dart';
import 'package:provider/provider.dart';


class Library extends StatefulWidget {
  final bool isKhmer;
  final VoidCallback toggleLanguage;

  Library({required this.isKhmer, required this.toggleLanguage});
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
      appBar: HeadBar(onLanguageToggle: widget.toggleLanguage, isKhmer: widget.isKhmer),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            LibraryMenu(
              onTabSelected: _onTabSelected,
              isKhmer: widget.isKhmer,
              toggleLanguage: widget.toggleLanguage,
            ),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Action for creating a playlist
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[850], // Background color similar to the UI
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.add,
                    size: 40.0,
                    color: Colors.white, // Icon color similar to the UI
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.isKhmer ? 'បង្កើតបញ្ជីចម្រៀង' :'Create a playlist',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white, // Text color similar to the UI
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
                  color: Colors.white, // Adjust the color as needed
                ),
                SizedBox(height: 16.0),
                Text(
                  widget.isKhmer ? 'គ្មានអ្វីត្រូវបានបញ្ចូល' :'Nothing has been Added',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust the color as needed
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.isKhmer ? 'រកមើលបទចម្រៀង បញ្ជីចាក់ ផតខាស និងអាល់ប៊ុម ដើម្បីបន្ថែមទៅចំណូលចិត្តរបស់អ្នក។' :'Browse songs, playlists, podcasts and albums to add to your favourites',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Adjust the color as needed
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
                  child: Text(widget.isKhmer ? 'ស្វែងរក' :'Explore Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylist() {
    return Container();
  }
  Widget _buildAlbums() {
    return Container();
  }
  Widget _buildPodCast() {
    return Container();
  }
}
