import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user["image"]),
            ),
            const SizedBox(height: 10),
            Text(
              "${user['firstName']} ${user['lastName']}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "@${user['username']}",
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  buildTile("ID", user["id"].toString()),
                  buildTile("Gender", user["gender"]),
                  buildTile("Email", user["email"]),
                  buildTile("Access Token", user["accessToken"]),
                  buildTile("Refresh Token", user["refreshToken"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
