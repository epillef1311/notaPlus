import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nota_mais/auth/view/register_view.dart';
import 'package:nota_mais/l10n/l10n.dart';
import 'package:nota_mais/ui/widgets/main_elevated_button.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

import '../widgets/login_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static String route = '/Login';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: DecoratedBox(
        key: const Key('decoratedBox-key'),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/schoolbc.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: Image.asset('assets/images/NotaLogo.png'),
                ),
                LoginFormField(
                  title: l10n.email,
                  hintText: l10n.email,
                ),
                const SizedBox(
                  height: 11,
                ),
                LoginFormField(
                  title: l10n.senha,
                  hintText: l10n.senha,
                ),
                const SizedBox(
                  height: 28,
                ),
                MainElevatedButton(
                  buttonText: l10n.entrar,
                  color: vermelho,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  l10n.esqueceuSenha,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    color: branco,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MainElevatedButton(
                  buttonText: l10n.criarConta,
                  color: verde,
                  onPressed: () {
                    context.push(RegisterView.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
