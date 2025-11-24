import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,

        child: Column(
          children: [
            Text(
              "Home Scrren",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Go to Offer Screen')),
            ElevatedButton(
              onPressed: () {},
              child: Text('Go to Profile Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
