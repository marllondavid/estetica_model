import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';
import 'package:estetica_model/src/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfessionalProfilePage extends StatelessWidget {
  const ProfessionalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Perfil Profissional"),
      backgroundColor: ColorsConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const Text("Informações da Clínica",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.primaryColor,
                )),
            const SizedBox(height: 10),
            _buildReadOnlyField(
                label: "Nome da Clínica", value: "Estética Avançada"),
            _buildReadOnlyField(label: "CNPJ", value: "12.345.678/0001-99"),
            _buildReadOnlyField(label: "Telefone", value: "(11) 91234-5678"),
            _buildReadOnlyField(label: "E-mail", value: "contato@estetica.com"),
            const SizedBox(height: 15),
            const Text("Informações Pessoais",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.primaryColor,
                )),
            const SizedBox(height: 10),
            _buildEditableField(
                label: "Nome Completo", initialValue: "Dra. Juliana Lima"),
            _buildEditableField(label: "CPF", initialValue: "123.456.789-00"),
            _buildEditableField(
                label: "Telefone", initialValue: "(11) 99876-5432"),
            _buildEditableField(
                label: "E-mail", initialValue: "dra.juliana@email.com"),
            const SizedBox(height: 20),
            const Text("Endereço",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.primaryColor,
                )),
            const SizedBox(height: 12),
            _buildEditableField(
                label: "Rua", initialValue: "Av. Paulista, 1000"),
            _buildEditableField(label: "Cidade", initialValue: "São Paulo"),
            _buildEditableField(label: "Estado", initialValue: "SP"),
            _buildEditableField(label: "CEP", initialValue: "01310-100"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Alterações salvas.")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstants.primaryColor,
              ),
              child: const Text("Salvar Alterações"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorsConstants.accentColor,
          ),
        ),
        const SizedBox(height: 4),
        CustomTextField(
          label: value,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildEditableField(
      {required String label, required String initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        CustomTextField(
          label: initialValue,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
