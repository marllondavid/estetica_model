import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';

class AuthProvider extends ChangeNotifier {
  UserEntity? _user;
  UserEntity? get user => _user;

  Future<bool> login(String email, String password) async {
    // Aqui você simula login, depois troca por chamada real
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'admin@admin.com' && password == '123456') {
      _user = UserEntity(
        id: '1',
        name: 'Administrador',
        email: email,
        role: 'admin',
      );
      notifyListeners();
      return true;
    }

    if (email == 'cliente@cliente.com' && password == '123456') {
      _user = UserEntity(
        id: '2',
        name: 'Cliente Estética',
        email: email,
        role: 'patient',
      );
      notifyListeners();
      return true;
    }

    return false;
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
