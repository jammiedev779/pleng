import 'package:flutter/material.dart';
import 'package:pleng/group/components/home_page/discover_playlists.dart';
import 'package:pleng/group/components/home_page/music_charts.dart';
import 'package:pleng/group/components/home_page/story_page.dart';
import 'package:pleng/group/components/discover_menu.dart';
import 'package:pleng/group/main_menu/main_menu.dart';
import 'package:pleng/group/headbar/head_bar.dart';

class HomePage extends StatelessWidget {

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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildAvatar(context, 'https://i.pravatar.cc/100?img=1',
                          'PlockLeang'),
                      _buildAvatar(context, 'https://i.pravatar.cc/100?img=2',
                          'GayChhi'),
                      _buildAvatar(context, 'https://i.pravatar.cc/100?img=3',
                          'Therayu'),
                      _buildAvatar(context, 'https://i.pravatar.cc/100?img=4',
                          'G-Devith'),
                      _buildAvatar(
                          context, 'https://i.pravatar.cc/100?img=5', 'Narin'),
                    ],
                  ),
                ),
              ),
              _buildSectionTitle('Pleng Exclusive Releases'),
              _buildExclusiveReleases(),
              _buildSectionTitle('Special Playlists by Pleng'),
              _buildSpecialPlaylists(),
              _buildSectionTitle('All hits'),
              _buildSpecialPlaylists(),
              _buildSectionTitle('Pleng Collection'),
              _buildAllCollections(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, String imageUrl, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StoryPage(imageUrl: imageUrl, userName: name),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
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
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
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

  Widget _buildExclusiveReleases() {
    return Container(
      height: 180, // Adjust height as needed
      child: PageView(
        children: [
          _buildExclusiveReleasesPage(
            [
              _buildExclusiveReleaseItem(
                'https://i.pinimg.com/474x/4d/32/5c/4d325cf1ba05cb71037e17467e5083bd.jpg',
                'Leak Tuk (Live Acoustic Cover)',
              ),
              _buildExclusiveReleaseItem(
                'https://union.illinois.edu/sites/default/files/2024-05/kLOopsjpSX1Wb1h8Vg57t7YEwD6.jpg',
                'Love Consult (Live Acoustic)',
              ),
              _buildExclusiveReleaseItem(
                'https://cdn.marvel.com/content/1x/thorloveandthunder_lob_crd_04.jpg',
                'Linju Meas Bong (Live Acoustic Cover)',
              ),
            ],
          ),
          _buildExclusiveReleasesPage(
            [
              _buildExclusiveReleaseItem(
                'https://i.pinimg.com/474x/4d/32/5c/4d325cf1ba05cb71037e17467e5083bd.jpg',
                'Leak Tuk (Live Acoustic Cover)',
              ),
              _buildExclusiveReleaseItem(
                'https://union.illinois.edu/sites/default/files/2024-05/kLOopsjpSX1Wb1h8Vg57t7YEwD6.jpg',
                'Love Consult (Live Acoustic)',
              ),
              _buildExclusiveReleaseItem(
                'https://cdn.marvel.com/content/1x/thorloveandthunder_lob_crd_04.jpg',
                'Linju Meas Bong (Live Acoustic Cover)',
              ),
            ],
          ),
          _buildExclusiveReleasesPage(
            [
              _buildExclusiveReleaseItem(
                'https://i.pinimg.com/474x/4d/32/5c/4d325cf1ba05cb71037e17467e5083bd.jpg',
                'Leak Tuk (Live Acoustic Cover)',
              ),
              _buildExclusiveReleaseItem(
                'https://union.illinois.edu/sites/default/files/2024-05/kLOopsjpSX1Wb1h8Vg57t7YEwD6.jpg',
                'Love Consult (Live Acoustic)',
              ),
              _buildExclusiveReleaseItem(
                'https://cdn.marvel.com/content/1x/thorloveandthunder_lob_crd_04.jpg',
                'Linju Meas Bong (Live Acoustic Cover)',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExclusiveReleasesPage(List<Widget> items) {
    return Column(
      children: items,
    );
  }

  Widget _buildExclusiveReleaseItem(String imageUrl, String title) {
    return ListTile(
      leading: _buildNetworkImage(imageUrl),
      title: Text(title, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildNetworkImage(String imageUrl) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSpecialPlaylists() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildPlaylistCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                'Top Songs'),
            _buildPlaylistCard(
                'https://rukminim2.flixcart.com/image/850/1000/kb5eikw0/poster/v/p/k/large-music-posters-for-room-set-of-6-best-music-posters-vintage-original-imafskknrpzzfcpq.jpeg?q=90&crop=false',
                'Still Viral'),
            _buildPlaylistCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                'New Albums'),
            _buildPlaylistCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                'New Albums'),
            _buildPlaylistCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                'New Albums'),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistCard(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
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

  Widget _buildAllCollections() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCollectionCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                'Top Songs'),
            _buildCollectionCard(
                'https://rukminim2.flixcart.com/image/850/1000/kb5eikw0/poster/v/p/k/large-music-posters-for-room-set-of-6-best-music-posters-vintage-original-imafskknrpzzfcpq.jpeg?q=90&crop=false',
                'Still Viral'),
            _buildCollectionCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                'New Albums'),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionCard(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 220,
            height: 140,
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
