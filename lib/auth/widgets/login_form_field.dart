import 'package:flutter/material.dart';
import 'package:nota_mais/ui/widgets/text_form_field_light_widget.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField(
      {this.title,
      this.hintText,
      this.controller,
      this.obscureText = false,
      super.key,});

  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 36,
          width: 325,
          child: Text(
            title ?? '',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Quicksand',
              color: branco,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: cinzaClaro,
            boxShadow: const [
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
            controller: controller,
            obscureText: obscureText,
            hintText: hintText,
            hintStyle: TextStyle(
              color: cinzaEscuro,
              fontSize: 18,
              fontFamily: 'Quicksand',
            ),
          ),
        ),
      ],
    );
  }
}
