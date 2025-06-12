import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:estetica_model/src/features/admin/domain/entities/patient_entity.dart';
import 'package:flutter/material.dart';

class PatientAutocomplete extends StatelessWidget {
  final List<PatientEntity> pacientes;
  final Function(PatientEntity) onSelect;

  const PatientAutocomplete({
    super.key,
    required this.pacientes,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<PatientEntity>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<PatientEntity>.empty();
        }
        final results = pacientes.where((paciente) => paciente.nome
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));

        if (results.isEmpty) {
          return [
            PatientEntity(
              cpf: '',
              nome: 'Cliente não encontrado com este nome',
              telefone: '',
              email: '',
              ultimoAtendimento: '',
            )
          ];
        }

        return results;
      },
      displayStringForOption: (PatientEntity option) => option.nome,
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          style: const TextStyle(color: ColorsConstants.textPrimary),
          decoration: InputDecoration(
            hintText: "Buscar Cliente",
            fillColor: ColorsConstants.white,
            filled: true,
            suffixIcon: const Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: ColorsConstants.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: ColorsConstants.primaryColor, width: 2),
            ),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.white,
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  final isFake = option.telefone.isEmpty;

                  return ListTile(
                    title: Text(
                      option.nome,
                      style: TextStyle(
                        color:
                            isFake ? Colors.grey : ColorsConstants.textPrimary,
                      ),
                    ),
                    onTap: isFake ? null : () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: (PatientEntity selection) {
        if (selection.telefone.isNotEmpty) {
          onSelect(selection);
        }
      },
    );
  }
}
