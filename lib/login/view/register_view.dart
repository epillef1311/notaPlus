import 'package:flutter/material.dart';
import 'package:nota_mais/l10n/l10n.dart';
import 'package:nota_mais/login/widgets/login_form_field.dart';
import 'package:nota_mais/ui/widgets/main_elevated_button.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 69,
                  width: double.infinity,
                  child: Image.asset('assets/images/BemVindo!.png'),
                ),
                SizedBox(
                  height: 40,
                  width: 278,
                  child: Text(
                    l10n.insiraInfoAbaixo,
                    style: TextStyle(
                      color: branco,
                      fontSize: 16,
                      fontFamily: 'Quicksand',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 45 ,
                ),
                LoginFormField(
                  title: l10n.nomeCompleto,
                ),
                const SizedBox(
                  height: 13,
                ),
                LoginFormField(title: l10n.email,),
                const SizedBox(
                  height: 13,
                ),
                LoginFormField(title: l10n.dataNascimento,),
                const SizedBox(
                  height: 13,
                ),
                LoginFormField(title: l10n.senha,),
                const SizedBox(
                  height: 13,
                ),
                LoginFormField(title: l10n.confirmeSenha,),
                const SizedBox(
                  height: 57,
                ),
                MainElevatedButton(buttonText: l10n.cadastrar, color: vermelho, onPressed: (){})

              ],
            ),
          ),
        ),
      ),
    );
  }
}
