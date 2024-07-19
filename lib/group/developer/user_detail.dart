import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user['name']['firstname']} ${user['name']['lastname']}'),
      ),
      backgroundColor: Color.fromARGB(255, 189, 183, 183),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
         
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user['profilePicture']),
              ),
            ),
            SizedBox(height: 16),
            GreenBox(
              icon: Icons.person,
              text: 'Name: ${user['name']['firstname']} ${user['name']['lastname']}',
            ),
            GreenBox(
              icon: Icons.account_circle,
              text: 'Username: ${user['username']}',
            ),
            GreenBox(
              icon: Icons.email,
              text: 'Email: ${user['email']}',
            ),
            GreenBox(
              icon: Icons.phone,
              text: 'Phone: ${user['phone']}',
            ),
            GreenBox(
              icon: Icons.home,
              text: 'Address: ${user['address']['street']}, ${user['address']['city']}',
            ),
          ],
        ),
      ),
    );
  }
}

class GreenBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const GreenBox({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
