// Arquivo de exemplo: features/patient/presentation/providers/patient_provider.dart
import 'package:flutter/material.dart';
import '../../domain/entities/patient_entity.dart';
import '../../domain/repositories/patient_repository.dart';

class PacienteProvider extends ChangeNotifier {
  final PacienteRepository repository;

  List<PacienteEntity> _list = [];
  List<PacienteEntity> get list => _list;

  bool isLoading = false;

  PacienteProvider({required this.repository});

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    _list = await repository.getAllPacientes();

    isLoading = false;
    notifyListeners();
  }
}
