import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppoinmentsHourPage extends StatelessWidget {
  final DateTime dataSelecionada;
  const AppoinmentsHourPage({super.key, required this.dataSelecionada});

  @override
  Widget build(BuildContext context) {
    final horarios = ["09:00", "10:00", "11:00", "14:00", "15:00"];
    return Scaffold(
      appBar: CustomAppBar(
        title: "Agenda de ${DateFormat('dd/MM/yyyy').format(dataSelecionada)}",
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: horarios.length,
        itemBuilder: (context, index) {
          return Card(
            color: ColorsConstants.primaryColor,
            child: ListTile(
              leading: const Icon(
                Icons.schedule,
                color: ColorsConstants.accentColor,
              ),
              title: Text(
                "Horário: ${horarios[index]}",
                style: TextStyle(
                  color: ColorsConstants.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                "Paciente: Nome Exemplo",
                style: TextStyle(
                  color: ColorsConstants.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
