import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';
import 'package:estetica_model/src/features/admin/domain/entities/patient_entity.dart';
import 'package:flutter/material.dart';

class ClientHistoryPage extends StatelessWidget {
  const ClientHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PatientEntity cliente =
        ModalRoute.of(context)!.settings.arguments as PatientEntity;

    final List<Map<String, String>> historicoAtendimentos = [
      {
        "data": "04/06/2025",
        "procedimento": "Botox",
        "observacoes": "Aplicação leve, retorno agendado em 15 dias.",
      },
      {
        "data": "15/05/2025",
        "procedimento": "Peeling Químico",
        "observacoes": "Cliente relatou sensibilidade leve.",
      },
      {
        "data": "02/04/2025",
        "procedimento": "Limpeza de Pele",
        "observacoes": "Pele com acne leve, bom resultado.",
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Histórico do Cliente",
      ),
      backgroundColor: ColorsConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informações do Cliente
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ListTile(
                title: Text(
                  cliente.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text("📞 ${cliente.telefone}"),
                    Text("📧 ${cliente.email}"),
                  ],
                ),
                leading: const CircleAvatar(
                  backgroundColor: ColorsConstants.primaryColor,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),

            const Text(
              "Atendimentos anteriores",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorsConstants.primaryColor,
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ListView.separated(
                itemCount: historicoAtendimentos.length,
                separatorBuilder: (context, index) => const Divider(height: 16),
                itemBuilder: (context, index) {
                  final atendimento = historicoAtendimentos[index];
                  return ListTile(
                    leading: const Icon(Icons.calendar_today,
                        color: ColorsConstants.primaryColor),
                    title: Text(
                      "${atendimento["data"]} — ${atendimento["procedimento"]}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(atendimento["observacoes"] ?? ""),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
