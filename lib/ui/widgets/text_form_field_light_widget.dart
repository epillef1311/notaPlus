import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nota_mais/utils/constants/color_const.dart';

class TextFormFieldLightWidget extends StatefulWidget {
  const TextFormFieldLightWidget({
    this.hintText,
    this.labelText,
    this.controller,
    this.onChanged,
    this.isEnabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.helperText,
    this.helperTextFontSize,
    this.autofillHints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintStyle,
    this.style,
    this.errorStyle,
    this.autoValidateMode,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.onSaved,
    this.margin,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.ensureVisible = false,
    this.maxLines = 1,
    this.readOnly = false,
    this.showErrorIcon = true,
    this.maxLength,
    this.isRequired = false,
    this.onTap,
    this.counterText,
    super.key,
  });

  final EdgeInsets? margin;
  final bool isEnabled;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final String? labelText;
  final String? helperText;
  final double? helperTextFontSize;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? errorStyle;
  final AutovalidateMode? autoValidateMode;
  final void Function()? onEditingComplete;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onSaved;
  final bool ensureVisible;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final int? maxLines;
  final bool readOnly;
  final bool showErrorIcon;
  final int? maxLength;
  final bool isRequired;
  final VoidCallback? onTap;
  final String? counterText;

  @override
  State<TextFormFieldLightWidget> createState() =>
      _TextFormFieldLightWidgetState();
}

class _TextFormFieldLightWidgetState extends State<TextFormFieldLightWidget> {
  final widgetKey = GlobalKey();
  late final _focusNode = widget.focusNode ?? FocusNode();
  final Color _disabledColor = branco.withOpacity(0.5);
  bool isInvalid = false;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      final widgetContext = widgetKey.currentContext;
      if (!widget.ensureVisible || widgetContext == null) {
        return setState(() {});
      }
      setState(() {
        Scrollable.ensureVisible(
          widgetContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          alignment: 0.18,
        );
      });
    });
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        onTap: widget.onTap,
        maxLength: widget.maxLength,
        key: widgetKey,
        enabled: widget.isEnabled,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: widget.obscureText,
        cursorColor: salmao,
        cursorWidth: 1,
        maxLines: widget.maxLines,
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        autofillHints: widget.autofillHints,
        obscuringCharacter: '*',
        onEditingComplete: widget.onEditingComplete,
        autovalidateMode: widget.autoValidateMode,
        readOnly: widget.readOnly,
        validator: (value) {
          final result = widget.validator?.call(value);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (result != null) {
              if (isInvalid) return;
              setState(() {
                isInvalid = true;
              });
              return;
            }
            if (!isInvalid || !mounted) return;
            setState(() {
              isInvalid = false;
            });
          });
          return result;
        },
        style: widget.style,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 29,
            vertical: 12,
          ),
          alignLabelWithHint: false,
          floatingLabelBehavior: widget.floatingLabelBehavior,
          labelText: (_focusNode.hasFocus && widget.isRequired)
              ? '${widget.labelText}*'
              : widget.labelText,
          labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 18,
                color: widget.isEnabled
                    ? isInvalid
                        ? salmao
                        : _focusNode.hasFocus
                            ? branco
                            : verde
                    : _disabledColor,
              ),
          helperText: widget.helperText,
          helperStyle: TextStyle(
            fontSize: widget.helperTextFontSize ?? 14,
            color: widget.isEnabled ? salmao : _disabledColor,
          ),
          suffixIcon: widget.suffixIcon ??
              (isInvalid && widget.showErrorIcon
                  ? const Icon(
                      Icons.error,
                      color: Colors.red,
                    )
                  : null),
          prefixIcon: widget.prefixIcon,
          errorStyle: widget.errorStyle,
          counterText: widget.counterText,
        ),
      ),
    );
  }
}
