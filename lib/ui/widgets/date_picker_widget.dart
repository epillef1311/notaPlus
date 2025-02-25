import 'package:flutter/material.dart';
import 'package:nota_mais/ui/widgets/text_form_field_light_widget.dart';

import 'package:nota_mais/utils/constants/color_const.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    required this.controller,
    this.title,
    this.color = salmao,
    super.key,
  });
  final TextEditingController controller;
  final Color color;
  final String? title;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 36,
          width: 325,
          child: Text(
            widget.title ?? '',
            style: const TextStyle(
                fontSize: 20, fontFamily: 'Quicksand', color: branco,),
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
            controller: widget.controller,
            prefixIcon: const Icon(Icons.calendar_today),
            readOnly: true,
            onTap: _selectDate,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1985),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        widget.controller.text = picked.toString().split(' ')[0];
      });
    }
  }
}
