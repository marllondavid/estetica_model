import '../../domain/entities/patient_entity.dart';
import '../../domain/repositories/patient_repository.dart';
import '../mock/mock_patients.dart';

class PatientRepositoryImpl implements PatientRepository {
  @override
  Future<List<PatientEntity>> getAllPatients() async {
    // simula tempo de resposta da API
    await Future.delayed(const Duration(milliseconds: 300));
    return mockPatients;
  }
}
