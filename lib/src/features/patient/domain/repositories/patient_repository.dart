import '../entities/patient_entity.dart';

abstract class PacienteRepository {
  Future<List<PacienteEntity>> getAllPacientes();
}