import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';

class DeepLinkProvider extends ChangeNotifier {
  Uri? _uri;
  Uri? get uri => _uri;

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  DeepLinkProvider() {
    _getInitialLink();
    _initializeDeepLinkListener();
  }

  Future<void> _getInitialLink() async {
    try {
      final initialLink = await _appLinks.getInitialLink();
      // Try both if needed:
      // final initialLink = await _appLinks.getInitialAppLink() ?? await _appLinks.getInitialLink();

      if (initialLink != null) {
        debugPrint('Initial deep link (cold start): $initialLink');
        _handleDeepLink(initialLink);
      } else {
        debugPrint('No initial deep link found');
      }
    } catch (e) {
      debugPrint('Error getting initial link: $e');
    }
  }

  void _initializeDeepLinkListener() {
    _linkSubscription = _appLinks.uriLinkStream.listen(
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

    // ✅ Perfect condition check
    if (uri.scheme == 'com.example.deeplink' ||
        uri.scheme == 'http' ||
        (uri.scheme == 'https' && uri.host == 'dp-link.vercel.app')) {

      // Save the deep link URI so UI can react
      _uri = uri;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }
}
