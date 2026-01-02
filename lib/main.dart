import 'dart:io';

import 'package:flutter/material.dart';
import 'package:markrun/domain/models/userInfo.dart';
import 'package:markrun/routing/AppRouter.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main()async {
  // 初始化 Flutter 绑定
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化 UserInfo
  debugPrint('Main: 开始初始化 UserInfo');
  await UserInfo.init();
  debugPrint('Main: UserInfo 初始化完成');

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



