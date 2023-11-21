
import 'package:flutter/material.dart';
import 'package:kuryer/presentattion/pages/home/home_page.dart';
import 'package:kuryer/presentattion/pages/splash/splash_page.dart';
import 'index_routes.dart';

//final localSource = inject<LocalSource>();

final GoRouter router = GoRouter(
    initialLocation: Routes.splash.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.home.name, 
        path: Routes.home.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const HomePage(),
        ),
      ),
       GoRoute(
        name: Routes.splash.name, 
        path: Routes.splash.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const SplashPage(),
        ),
      ),
      
    ],
    errorBuilder: (context, state) => const SizedBox());
