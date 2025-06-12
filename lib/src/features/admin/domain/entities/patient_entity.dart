class PatientEntity {
  final String nome;
  final String telefone;
  final String cpf;
  final String email;
  final String? ultimoAtendimento;

  PatientEntity({
    required this.nome,
    required this.telefone,
    required this.cpf,
    required this.email,
    this.ultimoAtendimento,
  });
}
