import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePatientPage extends StatefulWidget {
  const HomePatientPage({super.key});

  @override
  State<HomePatientPage> createState() => _HomePatientPageState();
}

class _HomePatientPageState extends State<HomePatientPage> {
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
            onTap: () => Navigator.pushNamed(context, '/patient/perfil'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Alycia Maria",
                            style: TextStyle(
                              color: ColorsConstants.primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "26 anos",
                            style: TextStyle(
                              color: ColorsConstants.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _showUserOptions,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/150?img=10"),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "A beleza da sua pele é a nossa prioridade",
                    style: TextStyle(
                      color: ColorsConstants.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // const SizedBox(height: 16),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: "Procure aqui...",
              //       fillColor: Colors.white,
              //       filled: true,
              //       suffixIcon: Icon(Icons.search),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(30),
              //         borderSide: BorderSide.none,
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: ColorsConstants.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Minha Agenda",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Detalhes",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          children: [
                            Icon(Icons.calendar_today, size: 18),
                            SizedBox(width: 8),
                            Text("12 Jun 2025  •  10:00 AM"),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/100?img=10'),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Drenagem",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text("Tratamento pós-operatório"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Service Categories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Serviços",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorsConstants.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildCategory(
                        "Limpeza de Pele", Icons.face_retouching_natural),
                    _buildCategory("Drenagem Facial", Icons.local_hospital),
                    _buildCategory("Design de Sobrancelhas", Icons.content_cut),
                    _buildCategory("Depilação", Icons.medical_services),
                    _buildCategory(
                        "Radio Frequência", Icons.graphic_eq_outlined),
                    _buildCategory(
                        "Visagismo", Icons.medical_information_outlined),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Todas as Categorias"),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsConstants.purple.withValues(alpha: 0.2),
            child: Icon(icon, color: ColorsConstants.primaryColor),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: ColorsConstants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
