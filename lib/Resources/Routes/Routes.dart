import 'package:get/route_manager.dart';
import 'package:getx_mvvm/Resources/Routes/RoutesNames.dart';
import 'package:getx_mvvm/View/Home/homeScreen.dart';
import 'package:getx_mvvm/View/SplashScreen.dart';
import 'package:getx_mvvm/View/login/loginview.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            page: () => SplashScreen(),
            name: RoutesNames.splashScreen,
            transitionDuration: Duration(milliseconds: 50),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesNames.loginScreen,
            page: () => LoginView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: Duration(milliseconds: 50)),
        GetPage(
            name: RoutesNames.homeScreen,
            page: () => HomeScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: Duration(milliseconds: 50))
      ];
}
