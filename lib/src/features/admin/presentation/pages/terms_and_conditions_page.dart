import 'package:estetica_model/src/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:estetica_model/src/core/constants/colors_constants.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Termos e Condições",
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            "Ao utilizar este aplicativo, você concorda com os termos e condições de uso. As informações dos pacientes devem ser mantidas em sigilo e utilizadas apenas para os fins de atendimento e gestão autorizados. Reservamo-nos o direito de atualizar estes termos periodicamente.",
            style: TextStyle(
              fontSize: 16,
              color: ColorsConstants.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
