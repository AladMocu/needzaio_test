
import 'package:auto_route/annotations.dart';
import 'package:needzaio_test/screens/home_screen.dart';
import 'package:needzaio_test/screens/login_screen.dart';
import 'package:needzaio_test/screens/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}