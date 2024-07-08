import 'package:flutter/material.dart';
import 'package:pleng/group/components/search/search_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQstSLn_yCOFPQ66fJ17gyaUpHsuE_l3dLNow&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwme89cM8YZvHcybGrZl_Obd9U9p5QabozJQ&s",
    "https://play-lh.googleusercontent.com/jInS55DYPnTZq8GpylyLmK2L2cDmUoahVacfN_Js_TsOkBEoizKmAl5-p8iFeLiNjtE=w526-h296-rw",
    "https://marketplace.canva.com/EAFHfL_zPBk/1/0/1600w/canva-yellow-inspiration-modern-instagram-profile-picture-kpZhUIzCx_w.jpg",
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDJ8fHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1541698444083-023c97d3f4b6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDJ8fHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDN8fHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1523240795612-9a054b0db644?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDd8fHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDl8fHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDEwfHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1498050108023-c5249f4df085?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDEyfHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDIzfHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
    "https://images.unsplash.com/photo-1523240795612-9a054b0db644?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDI1fHBob3RvfGVufDB8fHx8MTY0MzM4OTUxOQ&ixlib=rb-1.2.1&q=80&w=400",
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeNotifier.isDarkMode ? Colors.black : Colors.white,
        title: Text('Search', style: TextStyle(color: themeNotifier.isDarkMode ?Colors.white : Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.black : Color(0xFFffffff),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Music, Podcast, Artist and more',
                    hintStyle: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black),
                    prefixIcon: Icon(Icons.search, color: themeNotifier.isDarkMode ? Colors.white : Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: themeNotifier.isDarkMode ? Colors.grey[800] : Colors.grey[400],
                  ),
                  style: TextStyle(color:themeNotifier.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recommended for you',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaylistDetailScreen(imageUrl: images[index]),
                        ),
                      );
                    },
                    child: _buildRecommendedItem(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedItem(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        images[index],
        fit: BoxFit.cover,
      ),
    );
  }
}
