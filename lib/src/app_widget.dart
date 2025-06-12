import 'package:estetica_model/src/core/theme/theme_data.dart';
import 'package:estetica_model/src/features/admin/presentation/patient_module.dart';
import 'package:estetica_model/src/features/auth/auth_module.dart';
import 'package:estetica_model/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_routes.dart';
import 'features/admin/admin_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ...authModule,
        ...adminProviders,
        ...patientModule,
      ],
      child: MaterialApp(
        title: 'Estetica Model',
        theme: ThemeDataApp.lightTheme,
        darkTheme: ThemeDataApp.darkTheme,
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: AppRoutes.routes,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        locale: const Locale('pt', 'BR'),
      ),
    );
  }
}
