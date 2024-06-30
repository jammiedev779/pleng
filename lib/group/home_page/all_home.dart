import 'package:flutter/material.dart';
import 'package:pleng/group/components/discover_menu.dart';
import 'package:pleng/group/main_menu/main_menu.dart';
import 'package:pleng/group/headbar/head_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadBar(),
      body: Container(
        color: Colors.grey[900],
        child: SingleChildScrollView(
          child: Column(
            children: [
              DiscoverMenu(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAvatar('https://i.pravatar.cc/100?img=1', 'PlockLeang'),
                    _buildAvatar('https://i.pravatar.cc/100?img=2', 'GayChhi'),
                    _buildAvatar('https://i.pravatar.cc/100?img=3', 'Therayu'),
                    _buildAvatar('https://i.pravatar.cc/100?img=4', 'G-Devith'),
                    // _buildAvatar('https://i.pravatar.cc/100?img=5', 'Narin'),
                  ],
                ),
              ),
              _buildSectionTitle('Pleng Exclusive Releases'),
              _buildExclusiveReleases(),
              _buildSectionTitle('Special Playlists by Pleng'),
              _buildSpecialPlaylists(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(String imageUrl, String name) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green, width: 3),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildExclusiveReleases() {
    return Column(
      children: [
        ListTile(
          leading: _buildNetworkImage('https://i.pinimg.com/474x/4d/32/5c/4d325cf1ba05cb71037e17467e5083bd.jpg'),
          title: Text('Leak Tuk (Live Acoustic Cover)', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: _buildNetworkImage('https://cdn.marvel.com/content/1x/thorloveandthunder_lob_crd_04.jpg'),
          title: Text('Linju Meas Bong (Live Acoustic Cover)', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: _buildNetworkImage('https://union.illinois.edu/sites/default/files/2024-05/kLOopsjpSX1Wb1h8Vg57t7YEwD6.jpg'),
          title: Text('Love Consult (Live Acoustic)', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildSpecialPlaylists() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildPlaylistCard('https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg', 'Top Songs'),
          _buildPlaylistCard('https://rukminim2.flixcart.com/image/850/1000/kb5eikw0/poster/v/p/k/large-music-posters-for-room-set-of-6-best-music-posters-vintage-original-imafskknrpzzfcpq.jpeg?q=90&crop=false', 'Still Viral'),
          _buildPlaylistCard('https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg', 'New Albums'),
        ],
      ),
    );
  }

  Widget _buildNetworkImage(String imageUrl) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPlaylistCard(String imageUrl, String title) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
