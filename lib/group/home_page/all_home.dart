import 'package:flutter/material.dart';
import 'package:pleng/group/components/home_page/detail_music.dart';
import 'package:pleng/group/components/home_page/story_page.dart';
import 'package:pleng/group/components/discover_menu.dart';
import 'package:pleng/group/headbar/head_bar.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class HomePage extends StatefulWidget {
  final bool isKhmer;
  final VoidCallback toggleLanguage;

  HomePage({required this.isKhmer, required this.toggleLanguage});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;
  Set<int> _viewedStories = {};

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Scaffold(
      appBar: HeadBar(onLanguageToggle: widget.toggleLanguage, isKhmer: widget.isKhmer),
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.grey[900] : Color(0xFFffffff),
        child: Column(
          children: [
            DiscoverMenu(
              onTabSelected: _onTabSelected,
              isKhmer: widget.isKhmer,
              toggleLanguage: widget.toggleLanguage,
            ),
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
                _buildAvatar(context, 'https://imageio.forbes.com/specials-images/imageserve/65efb06d83b262e59c7fb3e9/Talib-Kweli-Wireless-Festival-2015/960x0.jpg?height=473&width=711&fit=bounds', 'PlockNun', 0),
                _buildAvatar(context, 'https://variety.com/wp-content/uploads/2024/02/Eminem.jpg', 'GayChhi', 1),
                _buildAvatar(context, 'https://media.gq.com/photos/62e82bea11673c699e05492d/master/pass/bs5a3113.JPG', 'Kendrick', 2),
                _buildAvatar(context, 'https://cdn.britannica.com/85/247585-050-13C54622/Rapper-Juice-WRLD-performs-Rolling-Loud-Festival-Los-Angeles-2018.jpg', 'Juice wrld', 3),
                _buildAvatar(context, 'https://static01.nyt.com/images/2021/12/08/arts/06drake2/06drake2-mediumSquareAt3X.jpg', 'Drake', 4),
              ],
            ),
          ),
        ),
        _buildSectionTitle(widget.isKhmer ? 'ការចេញផ្សាយចំនួនគួរអោយទាក់ទាញ' : 'Pleng Exclusive Releases'),
        _buildExclusiveReleases(),
        _buildSectionTitle(widget.isKhmer ? 'បញ្ជីចម្រៀងពិសេសដោយ Pleng' : 'Special Playlists by Pleng'),
        _buildSpecialPlaylists1(),
        _buildSectionTitle(widget.isKhmer ? 'ចម្រៀងទាំងអស់' : 'All hits'),
        _buildSpecialPlaylists(),
        _buildSectionTitle(widget.isKhmer ? 'ការចងក្រងនៃ Pleng' : 'Pleng Collection'),
        _buildAllCollections(),
      ],
    );
  }
  Widget _buildMusicChart() {
    return Column(
      children: [
        _buildSectionTitle(widget.isKhmer ? 'កំពូលចម្រៀងទាំង 10 ពី Production': 'Top 10 From Production Houses'),
        _buildSpecialPlaylists3(),
        _buildSectionTitle(widget.isKhmer ? 'ជម្រេីសប្រចាំថ្ងៃ' : 'Daily Choice'),
        _buildSpecialPlaylists1(),
        _buildSectionTitle(widget.isKhmer ? 'កំពូលចម្រៀងទាំង 50' : 'Top 50'),
        _buildSpecialPlaylists2(),
       
      ],
    );
  }

  Widget _buildDiscover() {
    return Column(
      children: [
        _buildSectionTitle(widget.isKhmer ? 'ចម្រៀងរដូវភ្លៀង' :'Rainy Season Music'),
        _buildSpecialPlaylists2(),
        _buildSectionTitle(widget.isKhmer ? 'ចម្រៀងពេញនិយម' :'All hits'),
        _buildSpecialPlaylists4(),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, String imageUrl, String name, int index) {
    final themeNotifier = context.watch<ThemeNotifier>();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StoryPage(
            stories: [
              {'imageUrl': 'https://imageio.forbes.com/specials-images/imageserve/65efb06d83b262e59c7fb3e9/Talib-Kweli-Wireless-Festival-2015/960x0.jpg?height=473&width=711&fit=bounds', 'userName': 'PlockNun'},
              {'imageUrl': 'https://variety.com/wp-content/uploads/2024/02/Eminem.jpg', 'userName': 'GayChhi'},
              {'imageUrl': 'https://media.gq.com/photos/62e82bea11673c699e05492d/master/pass/bs5a3113.JPG', 'userName': 'Kendrick'},
              {'imageUrl': 'https://cdn.britannica.com/85/247585-050-13C54622/Rapper-Juice-WRLD-performs-Rolling-Loud-Festival-Los-Angeles-2018.jpg', 'userName': 'Juice wrld'},
              {'imageUrl': 'https://static01.nyt.com/images/2021/12/08/arts/06drake2/06drake2-mediumSquareAt3X.jpg', 'userName': 'Drake'},
            ],
            initialIndex: index,
          ),
        )).then((_) {
          setState(() {
            _viewedStories.add(index);
          });
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _viewedStories.contains(index) ? Colors.grey : Colors.green, width: 3),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(height: 8),
            Text(name, style: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black, fontSize: 18)),
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
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlfJdx5FsA2i1Lic8-PWPHeU7iay6x1j0mXw&s',
                'Leak Tuk (Live Acoustic)',
              ),
              _buildExclusiveReleaseItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXMJJElshNUugqN70qKRVdQK6hAuCzQeqdlw&s',
                'Slow dancing in the dark',
              ),
              _buildExclusiveReleaseItem(
                'https://cdnb.artstation.com/p/assets/images/images/013/014/171/medium/catta-silva-polanco-joji.jpg?1537644864',
                'Dude, she is not into you ',
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
    final themeNotifier = context.watch<ThemeNotifier>();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMusic(imageUrl: imageUrl),
          ),
        );
      },
      child: ListTile(
        leading: _buildNetworkImage(imageUrl),
        title: Text(title, style: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black)),
      ),
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
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5TsLPVDfw7wrmFrZrKoqh-YYKRRdjAX3RcQ&s',
                widget.isKhmer ? 'អាល់ប៊ុមថ្មី' :'New Albums'),
            _buildPlaylistCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                widget.isKhmer ? 'ចម្រៀងកំពូល' :'Top Songs'),
            _buildPlaylistCard(
                'https://rukminim2.flixcart.com/image/850/1000/kb5eikw0/poster/v/p/k/large-music-posters-for-room-set-of-6-best-music-posters-vintage-original-imafskknrpzzfcpq.jpeg?q=90&crop=false',
                widget.isKhmer ? 'ចម្រៀងពេញនិយម' :'Still Viral'),
          ],
        ),
      ),
    );
  }
  Widget _buildSpecialPlaylists1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildPlaylistCard(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUNZpluHFU5qGG0j5KZz2IBWhY52XRNddp7Q&s',
                 widget.isKhmer ? 'ចេញក្តៅៗ' :'Hot Release'),
            _buildPlaylistCard(
                'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2023%2F07%2Fnas-magic-2-new-album-release-date-info-000.jpg?w=960&cbr=1&q=90&fit=max',
                widget.isKhmer ? 'កំពូលចម្រៀង Rap' :'Top Rap song'),
            _buildPlaylistCard(
                'https://i.pinimg.com/736x/98/00/6d/98006d0918e4193f9e75d409554a4f22.jpg',
                widget.isKhmer ? 'ចំនួនស្តាប់ច្រេីន​​​' :'Most Listen'),
          ],
        ),
      ),
    );
  }
  Widget _buildSpecialPlaylists2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildPlaylistCard(
                'https://newstreamasia.com/wp-content/uploads/2022/08/Photo-2_-Poster-of-Nicole-Niki-North-American-Tour-2022.jpg',
                widget.isKhmer ? 'ចម្រៀងខ្មែរ' :'Khmer Music'),
            _buildPlaylistCard(
                'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2023%2F07%2Fnas-magic-2-new-album-release-date-info-000.jpg?w=960&cbr=1&q=90&fit=max',
                widget.isKhmer ? 'កំពូលចម្រៀង Rap' :'Top Rap song'),
            _buildPlaylistCard(
                'https://pagesix.com/wp-content/uploads/sites/3/2024/02/taylor-swift-reputation-album-artwork-75767407.jpg?quality=75&strip=all&w=1016',
                widget.isKhmer ? 'ចំនួនស្តាប់ច្រេីន​​​' :'Most Listen'),
          ],
        ),
      ),
    );
  }
  Widget _buildSpecialPlaylists3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildPlaylistCard(
                'https://preview.redd.it/the-new-album-will-drop-on-v0-3kmpqebpf9bc1.jpeg?auto=webp&s=f4c41781c9892843cc57dbbe2ef93b68ad0bdc0b',
                widget.isKhmer ? 'ចម្រៀងថៃ' :'Thai Music'),
            _buildPlaylistCard(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4EIHx7Owv06NX4SdS3xs5whZkCILwGies7Q&s',
                widget.isKhmer ? 'ស្តាប់ chill' :'Chill Vibe'),
            _buildPlaylistCard(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNdmow0QMYeT5iWWjssPAq9UiYCzhKRu6eOA&s',
                widget.isKhmer ? 'ចម្រៀងកំសត់' :'Sad Music'),
          ],
        ),
      ),
    );
  }
    Widget _buildSpecialPlaylists4() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildPlaylistCard(
                'https://preview.redd.it/the-new-album-will-drop-on-v0-3kmpqebpf9bc1.jpeg?auto=webp&s=f4c41781c9892843cc57dbbe2ef93b68ad0bdc0b',
                widget.isKhmer ? 'ចម្រៀងថៃ' :'Thai Music'),
            _buildPlaylistCard(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsJyC5OGPp5ALImXY__ej_6UdTsgF4voUZA&s',
                'Taylor Swift'),
            _buildPlaylistCard(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnEU7htzxtnigh3i5w1-tnl7l_1kIa_O0cWw&s',
                widget.isKhmer ? 'តន្ត្រី Pop' :'Pop Music'),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistCard(String imageUrl, String title) {
    final themeNotifier = context.watch<ThemeNotifier>();

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
          Text(title, style: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black)),
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
                widget.isKhmer ? 'អាល់ប៊ុមថ្មី' :'New Albums'),
            _buildCollectionCard(
                'https://marketplace.canva.com/EAFIygYzkes/1/0/1131w/canva-blue-minimalist-concert-music-cover-poster-CGNgQz4KqL0.jpg',
                widget.isKhmer ? 'ចម្រៀងដែល HIT' :'Hits song'),
            _buildCollectionCard(
                'https://rukminim2.flixcart.com/image/850/1000/kb5eikw0/poster/v/p/k/large-music-posters-for-room-set-of-6-best-music-posters-vintage-original-imafskknrpzzfcpq.jpeg?q=90&crop=false',
                widget.isKhmer ? 'ចម្រៀងពេញនិយម' :'Trending'),
         
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionCard(String imageUrl, String title) {
        final themeNotifier = context.watch<ThemeNotifier>();

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
          Text(title, style: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}
