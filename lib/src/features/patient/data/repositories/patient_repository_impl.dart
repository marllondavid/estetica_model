import 'package:estetica_model/src/features/patient/domain/entities/patient_entity.dart';
import 'package:estetica_model/src/features/patient/domain/repositories/patient_repository.dart';

import '../mock/mock_patients.dart';

class PacienteRepositoryImpl implements PacienteRepository {
  @override
  Future<List<PacienteEntity>> getAllPacientes() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return mockPacientes;
  }
}
