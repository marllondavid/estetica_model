import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/alert_save_appoiment.dart';
import 'package:estetica_model/src/core/widgets/patiente_auto_complete.dart';
import 'package:estetica_model/src/features/admin/domain/entities/patient_entity.dart';
import 'package:estetica_model/src/features/admin/presentation/providers/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class AddAdminAppointmentsPage extends StatefulWidget {
  const AddAdminAppointmentsPage({super.key});

  @override
  State<AddAdminAppointmentsPage> createState() =>
      _AddAdminAppointmentsPageState();
}

class _AddAdminAppointmentsPageState extends State<AddAdminAppointmentsPage> {
  final _formKey = GlobalKey<FormState>();
  String? clientName;
  String? clienteCPF;
  String? procedimento;
  DateTime? dataSelecionada;
  TimeOfDay? horaSelecionada;

  final List<String> procedimentosDisponiveis = [
    'Limpeza de Pele',
    'Botox',
    'Preenchimento Labial',
    'Depilação a Laser',
    'Peeling Químico',
  ];

  void _selecionarCliente(PatientEntity paciente) {
    setState(() {
      clientName = paciente.nome;
      clienteCPF = paciente.telefone;
    });
  }

  Future<void> _selecionarData() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
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

    if (picked != null) {
      setState(() {
        dataSelecionada = picked;
      });
    }
  }

  Future<void> _selecionarHora() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 14, minute: 0),
    );
    if (picked != null) {
      setState(() {
        horaSelecionada = picked;
      });
    }
  }

  void _salvarAgendamento() {
    if (_formKey.currentState!.validate()) {
      if (dataSelecionada == null || horaSelecionada == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Por favor, selecione data e horário."),
          ),
        );
        return;
      }

      final dateFormate = DateFormat('dd/MM/yyyy').format(dataSelecionada!);
      final hourFormate =
          "${horaSelecionada!.hour.toString().padLeft(2, '0')}:${horaSelecionada!.minute.toString().padLeft(2, '0')}";

      showDialog(
          context: context,
          builder: (_) => AlertSaveAppoiment(
                clientName: clientName ?? '',
                procedimento: procedimento ?? '',
                dateFormate: dateFormate,
                hourFormate: hourFormate,
              ));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<PatientProvider>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PatientProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendar Atendimento"),
        backgroundColor: ColorsConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: ColorsConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              PatientAutocomplete(
                pacientes: provider.list,
                onSelect: _selecionarCliente,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: procedimento,
                decoration: const InputDecoration(
                  labelText: "Procedimento",
                  labelStyle: TextStyle(
                    color: ColorsConstants.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                items: procedimentosDisponiveis.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    procedimento = newValue;
                  });
                },
                validator: Validatorless.required("Procedimento obrigatório"),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _selecionarData,
                      icon: const Icon(Icons.calendar_month),
                      label: Text(dataSelecionada != null
                          ? DateFormat('dd/MM/yyyy').format(dataSelecionada!)
                          : "Selecionar Data"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _selecionarHora,
                      icon: const Icon(Icons.access_time),
                      label: Text(horaSelecionada != null
                          ? "${horaSelecionada!.hour.toString().padLeft(2, '0')}:${horaSelecionada!.minute.toString().padLeft(2, '0')}"
                          : "Selecionar Hora"),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _salvarAgendamento,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsConstants.primaryColor,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    "Salvar Agendamento",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
