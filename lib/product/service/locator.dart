import 'package:get_it/get_it.dart';
import 'package:managementexample/product/router/app_router.dart';
import 'package:managementexample/product/router/auth_guard.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard()));
}