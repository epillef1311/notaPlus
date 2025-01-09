import 'package:flutter/material.dart';
import 'package:nota_mais/di/core_di.dart';
import 'package:nota_mais/l10n/l10n.dart';
import 'package:nota_mais/login/view/register_view.dart';
import 'package:nota_mais/login/widgets/login_form_field.dart';
import 'package:nota_mais/ui/widgets/main_elevated_button.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  static String route = '/Login';
  final router = Di.getIt<ApiRouter>().router;

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
                SizedBox(
                  height: 36,
                  width: 325,
                  child: Text(
                    l10n.email,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      color: branco,
                    ),
                  ),
                ),
                const LoginFormField(
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 11,
                ),
                SizedBox(
                  height: 36,
                  width: 325,
                  child: Text(
                    l10n.senha,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      color: branco,
                    ),
                  ),
                ),
                const LoginFormField(
                  hintText: 'Senha',
                ),
                const SizedBox(
                  height: 28,
                ),
                MainElevatedButton(
                  buttonText: 'Entrar',
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
                  buttonText: 'Criar conta',
                  color: verde,
                  onPressed: () {
                    router.go(RegisterView.route);
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
