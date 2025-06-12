import 'dart:io';
import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class CustomTextField extends StatefulWidget {
  final Icon? preffixIcon;
  final String label;
  final String? additionalLabel;
  final bool? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatter;

  CustomTextField({
    super.key,
    this.preffixIcon,
    required this.label,
    this.additionalLabel,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.inputFormatter,
  })  : assert(
          obscureText == true ? suffixIconButton == null : true,
          'obscureText não pode ser enviado em conjunto com o suffixIconButton',
        ),
        obscureTextVN = ValueNotifier(obscureText);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final defaultInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
    borderSide: BorderSide(color: ColorsConstants.primaryColor),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.additionalLabel != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.additionalLabel!,
                  style: const TextStyle(
                    color: ColorsConstants.red,
                    fontSize: 14,
                  ),
                ),
              ),
            TextFormField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              keyboardType: Platform.isAndroid
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: widget.preffixIcon,
                labelText: widget.label,
                filled: true,
                fillColor: ColorsConstants.backgroundColor,
                labelStyle: const TextStyle(
                  color: ColorsConstants.purple,
                ),
                prefixIconColor: Colors.white,
                suffixIcon:
                    widget.suffixIconButton ?? (widget.obscureText == true)
                        ? IconButton(
                            onPressed: () {
                              widget.obscureTextVN.value = !obscureTextValue;
                            },
                            icon: Icon(!obscureTextValue
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )
                        : null,
                suffixIconColor: ColorsConstants.primaryColor,
                border: defaultInputBorder,
                enabledBorder: defaultInputBorder,
                focusedBorder: defaultInputBorder.copyWith(
                  borderSide: const BorderSide(
                    color: ColorsConstants.purple,
                  ),
                ),
                errorBorder: defaultInputBorder.copyWith(
                  borderSide: const BorderSide(
                    color: ColorsConstants.red,
                  ),
                ),
                isDense: true,
              ),
              obscureText: obscureTextValue,
              style: const TextStyle(color: ColorsConstants.primaryColor),
              controller: widget.controller,
              validator: widget.validator ??
                  Validatorless.required('Campo obrigatório'),
              inputFormatters: widget.inputFormatter ?? [],
            ),
          ],
        );
      },
    );
  }
}
