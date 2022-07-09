import 'package:auto_route/auto_route.dart';
import 'package:managementexample/core/constants/navigation_constants.dart';
import 'package:managementexample/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:managementexample/features/login/view/login_view.dart';
import 'package:managementexample/features/qr_check/view/qr_check_view.dart';
import 'package:managementexample/product/router/auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginView, path: NavigationConstants.LOGIN),
    AutoRoute(
        page: QRCheckView,
        guards: [AuthGuard],
        path: '${NavigationConstants.QR_CHECK}/:siteId/:job/:userName/:userId'),
    AutoRoute(
        page: HomeView,initial: true,
        guards: [AuthGuard],
        path: NavigationConstants.HOME),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}