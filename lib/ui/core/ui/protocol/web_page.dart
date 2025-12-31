import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class WebPage extends StatelessWidget{
  final String webUrl;
  late final WebViewController _controller;

   WebPage({
    required this.webUrl,
    super.key
}){
    _controller = WebViewController()..loadRequest(Uri.parse(webUrl));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}