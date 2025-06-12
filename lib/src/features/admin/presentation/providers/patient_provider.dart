import 'package:flutter/material.dart';
import '../../domain/entities/patient_entity.dart';
import '../../domain/repositories/patient_repository.dart';

class PatientProvider extends ChangeNotifier {
  final PatientRepository repository;

  List<PatientEntity> _list = [];
  List<PatientEntity> get list => _list;

  bool isLoading = false;

  PatientProvider({required this.repository});

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    _list = await repository.getAllPatients();

    isLoading = false;
    notifyListeners();
  }
}
