import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';
import 'package:estetica_model/src/core/widgets/patiente_auto_complete.dart';
import 'package:estetica_model/src/features/admin/domain/entities/patient_entity.dart';
import 'package:estetica_model/src/features/admin/presentation/providers/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class FillContractPage extends StatefulWidget {
  const FillContractPage({super.key});

  @override
  State<FillContractPage> createState() => _FillContractPageState();
}

class _FillContractPageState extends State<FillContractPage> {
  String? nomeCliente;
  String? cpfCliente;
  String? procedimento;
  DateTime? dataProcedimento;

  final List<String> procedimentosDisponiveis = [
    'Limpeza de Pele',
    'Botox',
    'Preenchimento Labial',
    'Depilação a Laser',
    'Peeling Químico',
  ];

  void _selecionarCliente(PatientEntity paciente) {
    setState(() {
      nomeCliente = paciente.nome;
      cpfCliente = paciente.telefone;
    });
  }

  void _selecionarData() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now, // só permite hoje em diante
      lastDate: now.add(const Duration(days: 365)),
      locale: const Locale('pt', 'BR'), // calendário em português
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorsConstants.primaryColor,
              onPrimary: Colors.white,
              onSurface: ColorsConstants.textPrimary,
            ),
            dialogBackgroundColor: ColorsConstants.backgroundColor,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: const TimePickerThemeData(
                backgroundColor: ColorsConstants.backgroundColor,
                dialHandColor: ColorsConstants.primaryColor,
                hourMinuteTextColor: ColorsConstants.textPrimary,
              ),
              colorScheme: const ColorScheme.light(
                primary: ColorsConstants.primaryColor,
                onSurface: ColorsConstants.textPrimary,
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        final fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          dataProcedimento = fullDateTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PatientProvider>();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Preencher Contrato",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PatientAutocomplete(
                pacientes: provider.list,
                onSelect: _selecionarCliente,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/616/616410.png'),
                          radius: 24,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Estética Bella Pele",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorsConstants.textPrimary,
                              ),
                            ),
                            Text(
                              "CNPJ: 00.000.000/0001-00",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorsConstants.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(height: 30, thickness: 1),
                    Text(
                      nomeCliente != null
                          ? "Eu, $nomeCliente (CPF: $cpfCliente), autorizo a realização do procedimento estético conforme orientações do profissional da clínica."
                          : "Selecione um paciente para preencher o contrato.",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorsConstants.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: procedimento,
                      decoration: const InputDecoration(
                        labelText: "Procedimento",
                        border: OutlineInputBorder(),
                      ),
                      items:
                          procedimentosDisponiveis.map((String procedimento) {
                        return DropdownMenuItem<String>(
                          value: procedimento,
                          child: Text(procedimento),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          procedimento = newValue!;
                        });
                      },
                      validator:
                          Validatorless.required("Selecione um procedimento"),
                    ),
                    Column(
                      children: [
                        const Text("Data do Procedimento: ",
                            style: TextStyle(fontSize: 14)),
                        const SizedBox(width: 8),
                        Text(
                          dataProcedimento != null
                              ? "${dataProcedimento!.day.toString().padLeft(2, '0')}/"
                                  "${dataProcedimento!.month.toString().padLeft(2, '0')}/"
                                  "${dataProcedimento!.year} às "
                                  "${dataProcedimento!.hour.toString().padLeft(2, '0')}:"
                                  "${dataProcedimento!.minute.toString().padLeft(2, '0')}"
                              : "Selecione a data e hora",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsConstants.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 36,
                          child: ElevatedButton(
                            onPressed: _selecionarData,
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                            ),
                            child: const Text("Selecionar"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Center(child: Text("Área de Assinatura")),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // salvar contrato e gerar PDF
                      },
                      child: const Text("Salvar Contrato e Assinatura"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
