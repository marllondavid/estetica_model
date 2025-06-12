import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/custom_text_field.dart';
import 'package:estetica_model/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _error;
  bool _submitted = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
      top: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: _submitted
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/estetica.png',
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _emailController,
                  label: 'E-mail',
                  validator: Validatorless.multiple([
                    Validatorless.required('E-mail é obrigatório'),
                    Validatorless.email('E-mail inválido'),
                  ]),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _passwordController,
                  obscureText: true,
                  label: 'Senha',
                  validator: Validatorless.required('Senha é obrigatória'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _loading
                        ? null
                        : () async {
                            setState(() {
                              _submitted = true;
                              _error = null;
                            });

                            final isValid =
                                _formKey.currentState?.validate() ?? false;
                            if (!isValid) return;

                            setState(() => _loading = true);

                            final success = await authProvider.login(
                              _emailController.text,
                              _passwordController.text,
                            );

                            setState(() => _loading = false);

                            if (success) {
                              final role = authProvider.user?.role;
                              if (role == 'admin') {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/admin',
                                  arguments: authProvider.user?.name,
                                );
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/patient');
                              }
                            } else {
                              setState(
                                  () => _error = 'E-mail ou senha inválidos.');
                            }
                          },
                    child: _loading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text("Acessar"),
                  ),
                ),
                if (_error != null && _submitted) ...[
                  const SizedBox(height: 10),
                  Text(
                    _error!,
                    style: const TextStyle(color: ColorsConstants.red),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
