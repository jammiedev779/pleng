import 'package:flutter/material.dart';
import 'package:pleng/group/components/home_page/discover_playlists.dart';
import 'package:pleng/group/components/home_page/music_charts.dart';
import 'package:pleng/group/components/home_page/story_page.dart';
import 'package:pleng/group/components/discover_menu.dart';
import 'package:pleng/group/headbar/head_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadBar(),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            DiscoverMenu(onTabSelected: _onTabSelected),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (_selectedTabIndex == 0) _buildAllContent(),
                    if (_selectedTabIndex == 1) _buildMusicChart(),
                    if (_selectedTabIndex == 2) _buildDiscover(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildAvatar(context, 'https://imageio.forbes.com/specials-images/imageserve/65efb06d83b262e59c7fb3e9/Talib-Kweli-Wireless-Festival-2015/960x0.jpg?height=473&width=711&fit=bounds', 'PlockNun'),
                _buildAvatar(context, 'https://variety.com/wp-content/uploads/2024/02/Eminem.jpg', 'GayChhi'),
                _buildAvatar(context, 'https://media.gq.com/photos/62e82bea11673c699e05492d/master/pass/bs5a3113.JPG', 'Kendrick'),
                _buildAvatar(context, 'https://cdn.britannica.com/85/247585-050-13C54622/Rapper-Juice-WRLD-performs-Rolling-Loud-Festival-Los-Angeles-2018.jpg', 'Juice wrld'),
                _buildAvatar(context, 'https://static01.nyt.com/images/2021/12/08/arts/06drake2/06drake2-mediumSquareAt3X.jpg', 'Drake'),
               
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
    );
  }
  Widget _buildMusicChart() {
    return Column(
      children: [
        _buildSectionTitle('Special Playlists by Pleng'),
        _buildSpecialPlaylists(),
        _buildSectionTitle('All hits'),
        _buildSpecialPlaylists(),
      ],
    );
  }
    Widget _buildDiscover() {
    return Column(
      children: [
        _buildSectionTitle('Special Playlists by Pleng'),
        _buildSpecialPlaylists(),
        _buildSectionTitle('All hits'),
        _buildSpecialPlaylists(),
      ],
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
      height: 180,
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
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ74F_RM69jaAlsm1EDvTF7KE16ziLofOdeLw&s',
                'New Albums'),
            _buildCollectionCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                'Hits song'),
            _buildCollectionCard(
                'https://rukminim2.flixcart.com/image/850/1000/kb5eikw0/poster/v/p/k/large-music-posters-for-room-set-of-6-best-music-posters-vintage-original-imafskknrpzzfcpq.jpeg?q=90&crop=false',
                'Trending'),
         
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
            width: 270,
            height: 150,
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
