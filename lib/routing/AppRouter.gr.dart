// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:markrun/ui/core/ui/protocol/web_page.dart' as _i8;
import 'package:markrun/ui/widgets/home_page.dart' as _i1;
import 'package:markrun/ui/widgets/launch_screen.dart' as _i2;
import 'package:markrun/ui/widgets/register/register_home_page.dart' as _i3;
import 'package:markrun/ui/widgets/register/register_page_1.dart' as _i4;
import 'package:markrun/ui/widgets/register/register_page_2.dart' as _i5;
import 'package:markrun/ui/widgets/register/register_page_3.dart' as _i6;
import 'package:markrun/ui/widgets/register/register_page_4.dart' as _i7;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LaunchScreen]
class LaunchRoute extends _i9.PageRouteInfo<void> {
  const LaunchRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LaunchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i2.LaunchScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterHomePage]
class RegisterHomeRoute extends _i9.PageRouteInfo<void> {
  const RegisterHomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterHomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i3.RegisterHomePage();
    },
  );
}

/// generated route for
/// [_i4.RegisterPage1]
class RegisterRoute1 extends _i9.PageRouteInfo<void> {
  const RegisterRoute1({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute1.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute1';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i4.RegisterPage1();
    },
  );
}

/// generated route for
/// [_i5.RegisterPage2]
class RegisterRoute2 extends _i9.PageRouteInfo<void> {
  const RegisterRoute2({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute2.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute2';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i5.RegisterPage2();
    },
  );
}

/// generated route for
/// [_i6.RegisterPage3]
class RegisterRoute3 extends _i9.PageRouteInfo<void> {
  const RegisterRoute3({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute3.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute3';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i6.RegisterPage3();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage4]
class RegisterRoute4 extends _i9.PageRouteInfo<void> {
  const RegisterRoute4({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute4.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute4';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i7.RegisterPage4();
    },
  );
}

/// generated route for
/// [_i8.WebPage]
class WebRoute extends _i9.PageRouteInfo<WebRouteArgs> {
  WebRoute({
    required String webUrl,
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          WebRoute.name,
          args: WebRouteArgs(
            webUrl: webUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WebRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebRouteArgs>();
      return _i8.WebPage(
        webUrl: args.webUrl,
        key: args.key,
      );
    },
  );
}

class WebRouteArgs {
  const WebRouteArgs({
    required this.webUrl,
    this.key,
  });

  final String webUrl;

  final _i10.Key? key;

  @override
  String toString() {
    return 'WebRouteArgs{webUrl: $webUrl, key: $key}';
  }
}
