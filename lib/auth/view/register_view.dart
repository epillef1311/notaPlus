import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nota_mais/auth/domain/auth_repository.dart';
import 'package:nota_mais/auth/widgets/login_form_field.dart';
import 'package:nota_mais/l10n/l10n.dart';
import 'package:nota_mais/ui/widgets/date_picker_widget.dart';
import 'package:nota_mais/ui/widgets/main_elevated_button.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static String route = '/register-view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _confirmeSenhaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authRepo = GetIt.instance.get<AuthRepository>();
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
            child: Form(
              key: _formKey,
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
                      style: const TextStyle(
                        color: branco,
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  LoginFormField(
                    title: l10n.nomeCompleto,
                    controller: _nomeController,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  LoginFormField(
                    title: l10n.email,
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  DatePickerWidget(
                    title: l10n.dataNascimento,
                    controller: _dataNascimentoController,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  LoginFormField(
                    title: l10n.senha,
                    controller: _senhaController,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  LoginFormField(
                    title: l10n.confirmeSenha,
                  ),
                  const SizedBox(
                    height: 57,
                  ),
                  MainElevatedButton(
                    buttonText: l10n.cadastrar,
                    color: vermelho,
                    onPressed: () async {
                      await authRepo.registerUser(
                        nome: _nomeController.text,
                        email: _emailController.text,
                        dataNascimento: _dataNascimentoController.text,
                        password: _senhaController.text,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
