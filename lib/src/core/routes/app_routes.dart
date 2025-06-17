import 'package:estetica_model/src/features/patient/presentation/pages/patient_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:estetica_model/src/features/splash/presentation/splash_page.dart';
import 'package:estetica_model/src/features/auth/presentation/pages/login_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/settings_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/about_app_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/client_list_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/fill_contract_page.dart';
import 'package:estetica_model/src/features/patient/presentation/pages/home_patient_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/client_history_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/admin_dashboard_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/register_patient_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/add_admin_appoiments_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/professional_profile_page.dart';
import 'package:estetica_model/src/features/admin/presentation/pages/terms_and_conditions_page.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const SplashPage(),
    '/login': (context) => const LoginPage(),
    '/admin': (context) => const AdminDashboardPage(
          userName: '',
        ),
    '/patient': (context) => const HomePatientPage(),
    '/patient/perfil': (context) => const PatientProfilePage(),
    '/admin/register': (context) => const RegisterPatientPage(),
    '/admin/contracts': (context) => const FillContractPage(),
    '/admin/appointments': (context) => const AddAdminAppointmentsPage(),
    '/admin/client': (context) => const ClientListPage(),
    '/admin/client-history': (context) => const ClientHistoryPage(),
    '/admin/perfil': (context) => const ProfessionalProfilePage(),
    '/admin/settings': (context) => const SettingsPage(),
    '/admin/about': (context) => const AboutAppPage(),
    '/admin/terms': (context) => const TermsAndConditionsPage(),
  };
}
