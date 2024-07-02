import 'package:flutter/material.dart';

class discoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSectionTitle(context, 'Top 50'),
          _buildMusicChart(),
          _buildSectionTitle(context, 'Top 50 From Production Houses'),
          _buildMusicChart(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildMusicChart() {
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildChartItem(
            'https://linktoimage1.com',
            'International Top 50',
            '3.8 M Plays',
          ),
          _buildChartItem(
            'https://linktoimage2.com',
            'Cambodia Top 50',
            '13.9 M Plays',
          ),
        ],
      ),
    );
  }

  Widget _buildChartItem(String imageUrl, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white)),
          Text(subtitle, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class DiscoverPlaylistsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSectionTitle(context, 'Discover Playlists'),
          _buildPlaylistList(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildPlaylistList() {
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPlaylistItem(
            'https://linktoimage3.com',
            'Top Songs',
          ),
          _buildPlaylistItem(
            'https://linktoimage4.com',
            'Still Viral',
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylistItem(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
