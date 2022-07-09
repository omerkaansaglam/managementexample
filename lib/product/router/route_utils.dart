enum ROUTE_PATH {
  splash,
  login,
  home,
  error,
  onBoarding
}

extension AppPageExtension on ROUTE_PATH {
  String get toPath {
    switch (this) {
      case ROUTE_PATH.home:
        return "/";
      case ROUTE_PATH.login:
        return "/login";
      case ROUTE_PATH.splash:
        return "/splash";
      case ROUTE_PATH.error:
        return "/error";
      case ROUTE_PATH.onBoarding:
        return "/start";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case ROUTE_PATH.home:
        return "home";
      case ROUTE_PATH.login:
        return "login";
      case ROUTE_PATH.splash:
        return "splash";
      case ROUTE_PATH.error:
        return "error";
      case ROUTE_PATH.onBoarding:
        return "start";
      default:
        return "home";
    }
  }

  String get toTitle {
    switch (this) {
      case ROUTE_PATH.home:
        return "My App";
      case ROUTE_PATH.login:
        return "My App Log In";
      case ROUTE_PATH.splash:
        return "My App Splash";
      case ROUTE_PATH.error:
        return "My App Error";
      case ROUTE_PATH.onBoarding:
        return "Welcome to My App";
      default:
        return "My App";
    }
  }
}