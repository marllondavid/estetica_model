import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';
import 'package:estetica_model/src/core/widgets/patiente_auto_complete.dart';
import 'package:estetica_model/src/features/admin/domain/entities/patient_entity.dart';
import 'package:estetica_model/src/features/admin/presentation/providers/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  List<PatientEntity> clientesFiltrados = [];
  PatientEntity? clienteSelecionado;

  @override
  void initState() {
    super.initState();
    final provider = context.read<PatientProvider>();
    provider.fetch().then((_) {
      setState(() {
        clientesFiltrados = provider.list;
      });
    });
  }

  void _filtrarClientes(PatientEntity paciente) {
    setState(() {
      clienteSelecionado = paciente;
      clientesFiltrados = [paciente];
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PatientProvider>();
    final clientes = provider.list;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Lista de Clientes",
      ),
      backgroundColor: ColorsConstants.backgroundColor,
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  PatientAutocomplete(
                    pacientes: clientes,
                    onSelect: _filtrarClientes,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: clientesFiltrados.length,
                      itemBuilder: (context, index) {
                        final cliente = clientesFiltrados[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cliente.nome,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: ColorsConstants.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  cliente.telefone,
                                  style: const TextStyle(
                                    color: ColorsConstants.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  cliente.email,
                                  style: const TextStyle(
                                    color: ColorsConstants.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Último atendimento: ${cliente.ultimoAtendimento}",
                                  style: const TextStyle(
                                    color: ColorsConstants.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const FaIcon(
                                        FontAwesomeIcons.whatsapp,
                                        color: Colors.green,
                                      ),
                                      tooltip: 'Enviar WhatsApp',
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.email,
                                        color: Colors.blueAccent,
                                      ),
                                      tooltip: 'Enviar E-mail',
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/admin/client-history',
                                          arguments: cliente,
                                        );
                                      },
                                      child: const Text(
                                        "Ver histórico",
                                        style: TextStyle(
                                          color: ColorsConstants.accentColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
