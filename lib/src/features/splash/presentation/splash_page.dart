import 'package:estetica_model/src/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _animationOpacityLogo = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 3),
          curve: Curves.ease,
          opacity: _animationOpacityLogo,
          onEnd: () {
            Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                  settings: const RouteSettings(name: '/login'),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const LoginPage();
                  },
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
                (route) => false);
          },
          child: Image.asset(
            'assets/logo/estetica.png',
          ),
        ),
      ),
    );
  }
}
