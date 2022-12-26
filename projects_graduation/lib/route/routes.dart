import 'package:flutter/material.dart';
import 'package:projects_graduation/pages/auth/profile/profile_Screen.dart';
import 'package:projects_graduation/pages/auth/signin/sign_in_screen.dart';
import 'package:projects_graduation/pages/auth/signup/sign_up_screen.dart';
import 'package:projects_graduation/pages/donator/home/home_screen.dart';
import 'package:projects_graduation/pages/donator/home/root.dart';
import 'package:projects_graduation/route/router_constans.dart';

import '../pages/splash/splash_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUpScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case appRootRoute:
        return MaterialPageRoute(builder: (_) => const AppRoot());
      case profileScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

pushNamed({required BuildContext context, required String routeName, dynamic arguments}) {
  if (arguments != null) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  } else {
    Navigator.pushNamed(context, routeName);
  }
}

pushNamedAndClearStack(BuildContext context, String routeName) {
  Navigator.of(context)
      .pushAndRemoveUntil(MyRouter.generateRoute(RouteSettings(name: routeName)), (Route<dynamic> route) => false);
}
