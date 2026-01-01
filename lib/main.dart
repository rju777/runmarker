import 'dart:io';

import 'package:flutter/material.dart';
import 'package:markrun/routing/AppRouter.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  // 初始化Flutter绑定
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}



