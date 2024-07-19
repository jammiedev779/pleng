// lib/group/developer/display_user.dart

import 'package:flutter/material.dart';
import 'user_detail.dart';
import 'static_users.dart';

class DisplayUser extends StatefulWidget {
  const DisplayUser({Key? key}) : super(key: key);

  @override
  _DisplayUserState createState() => _DisplayUserState();
}

class _DisplayUserState extends State<DisplayUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developers'),
      ),
      body: ListView.builder(
        itemCount: staticUsers.length,
        itemBuilder: (context, index) {
          final user = staticUsers[index];
          return Card(
            color: Colors.grey[300],
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user['profilePicture']),
  
              ),
              title: Text('${user['name']['firstname']} ${user['name']['lastname']}'),
              subtitle: Text(user['email']),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetail(user: user),
                    ),
                  );
                },
                child: Text('View'),
              ),
            ),
          );
        },
      ),
    );
  }
}
