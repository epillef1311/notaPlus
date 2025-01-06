import 'package:flutter/material.dart';
import 'package:nota_mais/ui/widgets/text_form_field_light_widget.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({this.hintText, super.key});

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: cinzaClaro,
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                spreadRadius: 0.1,
                blurRadius: 20,
                offset: Offset(5, 10),
            ),
          ],
        ),
      height: 48,
      width: 325,
      child: TextFormFieldLightWidget(
        hintText: hintText,
        hintStyle: TextStyle(
          color: cinzaEscuro,
          fontSize: 18,
          fontFamily: 'Quicksand',
        ),
      ),
    );
  }
}
