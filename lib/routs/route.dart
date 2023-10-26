import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/routs/routname.dart';
import 'package:movieapp/screens/blank.dart';
import 'package:movieapp/screens/login.dart';
import 'package:movieapp/screens/signup.dart';

import '../home/bottomnavigation.dart';

class AppRoute{
  static Route<dynamic> routesetting(RouteSettings setting){
    switch(setting.name){
      case RoutName.loginscreen:
        return MaterialPageRoute(builder: (context) => const Login(),);

      case RoutName.homescreen:
        return MaterialPageRoute(builder: (context) => const BottomNavigation(),);

      case RoutName.playinging:
        return MaterialPageRoute(builder: (context) => Blank(id: setting.arguments as String),);

      case RoutName.signintextpage:
        return MaterialPageRoute(builder: (context) => const Login(),);

      case RoutName.signuptextpage:
        return MaterialPageRoute(builder: (context) => const Signup(),);

      default :
        {
          return MaterialPageRoute(builder: (context) => const BottomNavigation(),);
        }

    }
  }
}