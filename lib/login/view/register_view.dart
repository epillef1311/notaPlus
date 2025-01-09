import 'package:flutter/material.dart';
import 'package:nota_mais/l10n/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static String route = '/register-view';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/schoolbc.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 180,
          width: 180,
          color: Colors.black,
        ),
      ),
    );
  }
}
