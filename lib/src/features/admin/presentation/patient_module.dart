import 'package:estetica_model/src/features/admin/data/repositories/patient_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:estetica_model/src/features/admin/presentation/providers/patient_provider.dart';

final patientModule = [
  ChangeNotifierProvider(
    create: (_) => PatientProvider(repository: PatientRepositoryImpl()),
  ),
];
