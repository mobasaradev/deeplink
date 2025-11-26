import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'provider/deep_link_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DeepLinkProvider(),
      child: const MyApp(),
    ),
  );
}
