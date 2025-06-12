import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class AlertSaveAppoiment extends StatelessWidget {
  final String clientName;
  final String procedimento;
  final String dateFormate;
  final String hourFormate;

  const AlertSaveAppoiment({
    super.key,
    required this.clientName,
    required this.procedimento,
    required this.dateFormate,
    required this.hourFormate,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsConstants.primaryColor,
      title: const Text(
        "Agendamento Salvo",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsConstants.white,
        ),
      ),
      content: Text(
        "Cliente: $clientName\nProcedimento: $procedimento\nData: $dateFormate\nHora: $hourFormate",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
