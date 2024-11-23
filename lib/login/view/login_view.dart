import 'package:flutter/material.dart';
import 'package:nota_mais/login/widgets/loginFormField.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 245,
              width: 1,
            ),
            SizedBox(
              height: 25,
              width: 325,
              child: Text(
                'Email',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Quicksand', color: branco),
              ),
            ),
            LoginFormField(
              hintText: 'Email',
            )
          ],
        ),
      ),
      backgroundColor: verde,
    );
  }
}
