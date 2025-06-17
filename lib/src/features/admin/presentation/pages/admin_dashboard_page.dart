import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/appoinments_hour_page.dart';
import 'package:estetica_model/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdminDashboardPage extends StatefulWidget {
  final String userName;
  const AdminDashboardPage({super.key, required this.userName});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  void _showUserOptions() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => Navigator.pushNamed(context, '/admin/perfil'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () => Navigator.pushNamed(context, '/admin/settings'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
              authProvider.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  final List<DateTime> agendamentos = [
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 3)),
    DateTime.now().add(const Duration(days: 5)),
  ];

  void _onDateTap(DateTime date) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppoinmentsHourPage(dataSelecionada: date),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: ColorsConstants.backgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 26),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Drª Antonella",
                            style: TextStyle(
                              color: ColorsConstants.accentColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "A beleza da sua pele é a nossa prioridade",
                            style: TextStyle(
                              color: ColorsConstants.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _showUserOptions,
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/150?img=9"),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Atendimentos na Semana',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ColorsConstants.accentColor,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    final date = now.add(Duration(days: index));
                    final isAgendado = agendamentos.any((d) =>
                        d.day == date.day &&
                        d.month == date.month &&
                        d.year == date.year);
                    final isSelected = selectedDate.day == date.day &&
                        selectedDate.month == date.month &&
                        selectedDate.year == date.year;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                        _onDateTap(date);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorsConstants.accentColor
                              : isAgendado
                                  ? ColorsConstants.primaryColor
                                  : ColorsConstants.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(DateFormat.E('pt_BR')
                                .format(date)
                                .toUpperCase()),
                            const SizedBox(height: 4),
                            Text(
                              date.day.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Ações Rápidas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ColorsConstants.accentColor,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 12,
                  children: [
                    _buildAction("Cadastrar Paciente", Icons.person_add,
                        '/admin/register'),
                    _buildAction("Assinar Contrato", Icons.edit_document,
                        '/admin/contracts'),
                    _buildAction("Agendar Pacientes", Icons.edit_calendar_sharp,
                        '/admin/appointments'),
                    _buildAction(
                        "Lista de Clientes", Icons.list, '/admin/client'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Gráfico de Quant. de atendimentos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ColorsConstants.accentColor,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      makeGroup(0, 5),
                      makeGroup(1, 8),
                      makeGroup(2, 6),
                      makeGroup(3, 10),
                      makeGroup(4, 7),
                      makeGroup(5, 4),
                      makeGroup(6, 2),
                    ],
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            const days = [
                              'DOM.',
                              'SEG.',
                              'TER.',
                              'QUA.',
                              'QUI.',
                              'SEX.',
                              'SAB.'
                            ];
                            return Text(
                              days[value.toInt()],
                              style: TextStyle(
                                color: ColorsConstants.accentColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroup(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(toY: y, width: 18, color: ColorsConstants.purple),
    ]);
  }

  Widget _buildAction(String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: ColorsConstants.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorsConstants.backgroundColor, size: 30),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
