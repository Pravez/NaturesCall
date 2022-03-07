import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:nature_call/feature_home/views/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/home', page: HomePage, initial: true)
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter{}