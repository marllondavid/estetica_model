import 'package:flutter/material.dart';
import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Configurações"),
      backgroundColor: ColorsConstants.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Preferências do Aplicativo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsConstants.primaryColor,
              )),
          const SizedBox(height: 12),
          SwitchListTile(
            value: true,
            onChanged: (val) {},
            title: const Text("Receber notificações"),
          ),
          // ListTile(
          //   title: const Text("Idioma"),
          //   subtitle: const Text("Português (Brasil)"),
          //   trailing: const Icon(Icons.arrow_forward_ios),
          //   onTap: () {},
          // ),

          const Divider(height: 32),
          const Text("Outros",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsConstants.primaryColor,
              )),
          ListTile(
            title: const Text("Sobre o App"),
            leading: const Icon(Icons.info_outline),
            onTap: () {
              Navigator.pushNamed(context, '/admin/about');
            },
          ),
          ListTile(
            title: const Text("Termos e Condições"),
            leading: const Icon(Icons.description_outlined),
            onTap: () {
              Navigator.pushNamed(context, '/admin/terms');
            },
          ),
        ],
      ),
    );
  }
}
