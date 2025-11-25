import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:deeplink/screen/splash_screen.dart';
import 'package:flutter/material.dart';

/// For app_links package
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    _initializeDeepLinkListener();
  }

  void _initializeDeepLinkListener() {
    final appLinks = AppLinks();

    _linkSubscription = appLinks.uriLinkStream.listen(
      (Uri? uri) {
        if (uri != null) {
          _handleDeepLink(uri);
        }
      },
      onError: (err) {
        debugPrint('Error handling deep link: $err');
      },
    );
  }

  void _handleDeepLink(Uri uri) {
    debugPrint('deeplink Url: $uri');
    if (uri.scheme == 'com.example.deeplink' ||
        uri.scheme == 'http' ||
        uri.scheme == 'https' && uri.host == 'deep-link-eight.vercel.app') {
      String? deepLinkPath;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SplashScreen(deepLink: deepLinkPath),
        ),
      );
    }
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
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

/// For uni_links package:::

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   StreamSubscription? _sub;
//
//   @override
//   void initState() {
//     super.initState();
//     initDeepLinkListener();
//     handleInitialUri();
//   }
//
//   Future<void> handleInitialUri() async {
//     final uri = await getInitialUri();
//     if (uri != null) {
//       _handleRouting(uri);
//     }
//   }
//
//   void initDeepLinkListener() {
//     _sub = uriLinkStream.listen((Uri? uri) {
//       if (uri != null) {
//         _handleRouting(uri);
//       }
//     });
//   }
//
//   void _handleRouting(Uri uri) {
//     // Example: myapp://product?id=100
//     final path = uri.path;
//     final query = uri.queryParameters;
//
//     if (path == '/product') {
//       final id = query['id'];
//       Navigator.pushNamed(context, '/product', arguments: id);
//     }
//   }
//
//   @override
//   void dispose() {
//     _sub?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
