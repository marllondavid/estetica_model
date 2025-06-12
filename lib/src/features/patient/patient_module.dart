import 'package:provider/provider.dart';
import 'presentation/providers/patient_provider.dart';
import 'data/repositories/patient_repository_impl.dart';

final List<ChangeNotifierProvider> patientProviders = [
  ChangeNotifierProvider<PacienteProvider>(
    create: (_) => PacienteProvider(repository: PacienteRepositoryImpl()),
  ),
];
