import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';
import 'package:estetica_model/src/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPatientPage extends StatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _dataNascController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cadastrar Paciente",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: "Nome Completo",
                  controller: _nameController,
                  validator: Validatorless.required("Nome obrigatório"),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  label: "CPF",
                  controller: _cpfController,
                  validator: Validatorless.required("CPF obrigatório"),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  label: "E-mail",
                  controller: _emailController,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required("E-mail obrigatório"),
                      Validatorless.email("E-mail inválido"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  label: "Data de Nascimento",
                  controller: _dataNascController,
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: Validatorless.required(
                      "Data de Nascimento é obrigatória"),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Paciente cadastrado!")),
                        );
                      }
                    },
                    child: const Text("Cadastrar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
