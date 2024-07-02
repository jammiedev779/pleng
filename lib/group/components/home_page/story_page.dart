import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final String imageUrl;
  final String userName;

  const StoryPage({Key? key, required this.imageUrl, required this.userName}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..forward().whenComplete(() => Navigator.of(context).pop());

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio( 
              aspectRatio: 9 / 16,
              child: Image.network(widget.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Column(
              children: [
                SizedBox(height: 1),
                Container(
                  height: 2,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    value: _controller.value,
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.imageUrl),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.userName, style: TextStyle(color: Colors.white, fontSize: 18)),
                        Text('1h ago', style: TextStyle(color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
      
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text('Listen Now', style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
