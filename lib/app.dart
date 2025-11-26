import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

import 'feature/splash_screen.dart';

/// For uni_links package:::
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _linkSub;
  String? _deepLink;

  @override
  void initState() {
    super.initState();
    _listenForIncomingLinks();
    _handleInitialUri();
  }

  // 1️⃣ Cold start link
  Future<void> _handleInitialUri() async {
    try {
      final uri = await getInitialUri();
      if (uri != null) {
        debugPrint("Initial deep link: $uri");
        setState(() => _deepLink = uri.toString());
      }
    } catch (e) {
      debugPrint("Initial URI error: $e");
    }
  }

  // 2️⃣ Background / foreground link
  void _listenForIncomingLinks() {
    _linkSub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        debugPrint("Stream deep link: $uri");
        setState(() => _deepLink = uri.toString());
      }
    }, onError: (err) => debugPrint("Stream error: $err"));
  }

  @override
  void dispose() {
    _linkSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}

// import 'package:app_links/app_links.dart';

/// For app_links package
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   StreamSubscription<Uri>? _linkSubscription;

//   @override
//   void initState() {
//     super.initState();
//     _initializeDeepLinkListener();
//   }

//   void _initializeDeepLinkListener() {
//     final appLinks = AppLinks();

//     _linkSubscription = appLinks.uriLinkStream.listen(
//       (Uri? uri) {
//         if (uri != null) {
//           _handleDeepLink(uri);
//         }
//       },
//       onError: (err) {
//         debugPrint('Error handling deep link: $err');
//       },
//     );
//   }

//   void _handleDeepLink(Uri uri) {
//     debugPrint('deeplink Url: $uri');
//     if (uri.scheme == 'com.example.deeplink' ||
//         uri.scheme == 'http' ||
//         uri.scheme == 'https' && uri.host == 'dp-link.vercel.app') {
//       String? deepLinkPath;

//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => SplashScreen(deepLink: deepLinkPath),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _linkSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }
