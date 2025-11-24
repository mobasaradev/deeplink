import 'package:flutter/material.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offer Screen"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,

        child: Column(
          children: [
            Text(
              "Offer Scrren",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Go to Home Screen')),
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
