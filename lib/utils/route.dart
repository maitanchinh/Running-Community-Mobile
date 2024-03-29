import 'package:flutter/material.dart';
import 'package:running_community_mobile/screens/CreateGroupScreen.dart';
import 'package:running_community_mobile/screens/CreatePostScreen.dart';
import 'package:running_community_mobile/screens/GroupDetailScreen.dart';
import 'package:running_community_mobile/screens/LoginScreen.dart';
import 'package:running_community_mobile/screens/PostsScreen.dart';
import 'package:running_community_mobile/screens/SignUpScreen.dart';
import '../screens/DashboardScreen.dart';
import '../screens/SplashScreen.dart';
import '../screens/NotFoundScreen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case DashboardScreen.routeName:
      return MaterialPageRoute(builder: (_) => DashboardScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case CreateGroupScreen.routeName:
      return MaterialPageRoute(builder: (_) => const CreateGroupScreen());
    case GroupDetailScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => GroupDetailScreen(
                id: settings.arguments.toString(),
              ));
    case PostsScreen.routeName:
      return MaterialPageRoute(builder: (_) => PostsScreen(groupId: settings.arguments.toString(),));
    case CreatePostScreen.routeName:
      return MaterialPageRoute(builder: (_) => const CreatePostScreen());
    default:
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
  }
}
