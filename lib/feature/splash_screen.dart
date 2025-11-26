import 'package:flutter/material.dart';

import 'navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.deepLink});
  final String? deepLink;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateAfterDelay();
    });
  }

  Future<void> navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    debugPrint('Deep link Url: ${widget.deepLink}');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Navigation(deepLink: widget.deepLink)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
