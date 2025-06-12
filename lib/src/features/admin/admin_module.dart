import 'package:provider/provider.dart';
import 'presentation/providers/patient_provider.dart';
import 'data/repositories/patient_repository_impl.dart';

final List<ChangeNotifierProvider> adminProviders = [
  ChangeNotifierProvider<PatientProvider>(
    create: (_) => PatientProvider(repository: PatientRepositoryImpl()),
  ),
];
