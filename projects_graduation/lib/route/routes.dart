import 'package:flutter/material.dart';
import 'package:projects_graduation/pages/auth/profile/donor/profile_Screen.dart';
import 'package:projects_graduation/pages/auth/signin/charity/charity_sign_in.dart';
import 'package:projects_graduation/pages/auth/signin/sign_in_screen.dart';
import 'package:projects_graduation/pages/auth/signup/charity/sign_up_screen.dart';
import 'package:projects_graduation/pages/auth/signup/donor%20/sign_up_screen.dart';
import 'package:projects_graduation/pages/collector/home/root.dart';
import 'package:projects_graduation/pages/splash/intro_screen.dart';
import 'package:projects_graduation/route/router_constans.dart';

import '../pages/donor/home/home_screen.dart';
import '../pages/donor/home/root.dart';
import '../pages/splash/splash_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case donorSignUpScreenRoute:
        return MaterialPageRoute(builder: (_) => const DonorSignUpScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case appRootRoute:
        return MaterialPageRoute(builder: (_) => const AppRoot());
      case charityAppRootRoute:
        return MaterialPageRoute(builder: (_) => const CharityAppRoot());
      case profileScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case introScreenRoute:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case charitySignUpScreenRoute:
        return MaterialPageRoute(builder: (_) => const CharitySignUpScreen());
      case charitySignInScreen:
        return MaterialPageRoute(builder: (_) => const CharitySignInScreen());
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
