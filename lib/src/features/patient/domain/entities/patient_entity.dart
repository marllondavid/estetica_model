class PacienteEntity {
  final String nome;
  final String telefone;
  final String email;
  final String? especialidade;

  PacienteEntity({
    required this.nome,
    required this.telefone,
    required this.email,
    this.especialidade,
  });
}
