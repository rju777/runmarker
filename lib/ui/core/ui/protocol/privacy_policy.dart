import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markrun/routing/AppRouter.dart';
import 'package:markrun/routing/AppRouter.gr.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget{
  final String text = 'User Agreement';
  final String webUrl = 'https://resource.mark-run.com/MarkRun/privacy.html';

  @override
  State<StatefulWidget> createState() => PrivacyPolicyState();
}

class PrivacyPolicyState extends State<PrivacyPolicy>{
  final _appRouter = AppRouter();
  late final WebViewController _controller ;

  @override
  void initState() {
    _controller = WebViewController()..loadRequest(Uri.parse(widget.webUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          _appRouter.push(WebRoute(webUrl: widget.webUrl));
        },
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 11,
          ),
        )
    );
  }
}