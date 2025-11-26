import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feature/splash_screen.dart';
import 'provider/deep_link_provider.dart';


/// For app_links package
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final deepLinkUri = context.watch<DeepLinkProvider>().uri;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  SplashScreen(deepLink: deepLinkUri?.toString()),
    );
  }
}
