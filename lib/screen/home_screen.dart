import 'package:deeplink/screen/offer_screen.dart';
import 'package:deeplink/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.deepLink});

  final String? deepLink;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.deepLink != null && context.mounted) {
        debugPrint('Handling deep link: ${widget.deepLink}');

        if (widget.deepLink!.contains('offer_screen')) {
          debugPrint('Pushing Offer Screen from NavigationScreen');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OfferScreen()),
          );
        } else if (widget.deepLink!.contains('profile_screen')) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
      }
    });
  }

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
