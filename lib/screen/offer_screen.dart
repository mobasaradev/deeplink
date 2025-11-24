import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
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
