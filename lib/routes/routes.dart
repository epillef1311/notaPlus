import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nota_mais/login/view/login_view.dart';
import 'package:nota_mais/login/view/register_view.dart';

final routers = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/register-view',
      pageBuilder: (context, state) =>
          const MaterialPage(child: RegisterView(), fullscreenDialog: true),
    ),
  ],
);
