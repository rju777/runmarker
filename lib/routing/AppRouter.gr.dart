// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:markrun/ui/core/ui/protocol/web_page.dart' as _i4;
import 'package:markrun/ui/widgets/launch_screen.dart' as _i1;
import 'package:markrun/ui/widgets/register/register_home_page.dart' as _i2;
import 'package:markrun/ui/widgets/register/register_page_1.dart' as _i3;

/// generated route for
/// [_i1.LaunchScreen]
class LaunchRoute extends _i5.PageRouteInfo<void> {
  const LaunchRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LaunchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i1.LaunchScreen();
    },
  );
}

/// generated route for
/// [_i2.RegisterHomePage]
class RegisterHomeRoute extends _i5.PageRouteInfo<void> {
  const RegisterHomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RegisterHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterHomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i2.RegisterHomePage();
    },
  );
}

/// generated route for
/// [_i3.RegisterPage1]
class RegisterRoute1 extends _i5.PageRouteInfo<void> {
  const RegisterRoute1({List<_i5.PageRouteInfo>? children})
      : super(
          RegisterRoute1.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute1';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i3.RegisterPage1();
    },
  );
}

/// generated route for
/// [_i4.WebPage]
class WebRoute extends _i5.PageRouteInfo<WebRouteArgs> {
  WebRoute({
    required String webUrl,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          WebRoute.name,
          args: WebRouteArgs(
            webUrl: webUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WebRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebRouteArgs>();
      return _i4.WebPage(
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

  final _i6.Key? key;

  @override
  String toString() {
    return 'WebRouteArgs{webUrl: $webUrl, key: $key}';
  }
}
