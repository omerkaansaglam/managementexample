// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginView());
    },
    QRCheckRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<QRCheckRouteArgs>(
          orElse: () => QRCheckRouteArgs(
              siteId: pathParams.getString('siteId'),
              job: pathParams.getNum('job'),
              userName: pathParams.getString('userName')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: QRCheckView(
              key: args.key,
              siteId: args.siteId,
              job: args.job,
              userName: args.userName));
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(QRCheckRoute.name,
            path: '/qr-check/:siteId/:job/:userName/:userId',
            guards: [authGuard]),
        RouteConfig(HomeRoute.name, path: '/home', guards: [authGuard])
      ];
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [QRCheckView]
class QRCheckRoute extends PageRouteInfo<QRCheckRouteArgs> {
  QRCheckRoute(
      {Key? key,
      required String siteId,
      required num job,
      required String userName})
      : super(QRCheckRoute.name,
            path: '/qr-check/:siteId/:job/:userName/:userId',
            args: QRCheckRouteArgs(
                key: key, siteId: siteId, job: job, userName: userName),
            rawPathParams: {
              'siteId': siteId,
              'job': job,
              'userName': userName
            });

  static const String name = 'QRCheckRoute';
}

class QRCheckRouteArgs {
  const QRCheckRouteArgs(
      {this.key,
      required this.siteId,
      required this.job,
      required this.userName});

  final Key? key;

  final String siteId;

  final num job;

  final String userName;

  @override
  String toString() {
    return 'QRCheckRouteArgs{key: $key, siteId: $siteId, job: $job, userName: $userName}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}
