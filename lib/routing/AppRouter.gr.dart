// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:markrun/ui/core/ui/protocol/web_page.dart' as _i2;
import 'package:markrun/ui/widgets/launch_screen.dart' as _i1;

/// generated route for
/// [_i1.LaunchScreen]
class LaunchRoute extends _i3.PageRouteInfo<void> {
  const LaunchRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LaunchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i1.LaunchScreen();
    },
  );
}

/// generated route for
/// [_i2.WebPage]
class WebRoute extends _i3.PageRouteInfo<WebRouteArgs> {
  WebRoute({
    required String webUrl,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          WebRoute.name,
          args: WebRouteArgs(
            webUrl: webUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WebRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebRouteArgs>();
      return _i2.WebPage(
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

  final _i4.Key? key;

  @override
  String toString() {
    return 'WebRouteArgs{webUrl: $webUrl, key: $key}';
  }
}
