import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,

        child: Column(
          children: [
            Text(
              "Profile Scrren",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Go to Home Screen')),
            ElevatedButton(
              onPressed: () {},
              child: Text('Go to Offer Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
