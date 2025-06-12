# estetica_model - Sistema para Clínicas de Estética

Este projeto é um sistema completo para clínicas de estética, desenvolvido em **Flutter** utilizando **arquitetura limpa**, **Provider** para gerenciamento de estado e **componentização modular**. Ele visa facilitar o agendamento de procedimentos, gestão de clientes, histórico de atendimentos, assinaturas de contrato e muito mais.

---

## Funcionalidades principais

- Cadastro e listagem de **clientes (pacientes)**
- Histórico de atendimentos
- Autocomplete com busca inteligente por nome
- Área de assinatura digital de contratos
- Tela de perfil do profissional
- Tela de configurações e preferências do app
- Páginas de Termos e Condições e Sobre o Aplicativo

---

## Tecnologias e práticas utilizadas

| Tecnologia         | Descrição                                                  |
|--------------------|------------------------------------------------------------|
| **Flutter**        | Framework principal da aplicação                           |
| **Provider**       | Gerenciamento de estado leve, simples e eficiente          |
| **Clean Architecture** | Organização em camadas: `domain`, `data`, `presentation` |
| **Modularização**  | Divisão de módulos plugáveis por funcionalidade            |
| **Mock Data**      | Dados simulados para testes e prototipação inicial         |

---

## Estrutura de pastas (resumida)

```
lib/
├── core/               # Temas, constantes, utilitários
├── domain/             # Entidades e contratos (regras de negócio)
├── data/               # Repositórios e dados simulados
├── providers/          # Providers usando ChangeNotifier
├── modules/            # Módulos plugáveis: paciente, profissional, etc.
├── pages/              # Telas do app organizadas por contexto
├── widgets/            # Componentes reutilizáveis
└── main.dart
```

---

## Como executar o projeto

1. Certifique-se de ter o Flutter instalado:
   ```bash
   flutter doctor
   ```

2. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/estetica_model.git
   cd estetica_model
   ```

3. Instale as dependências:
   ```bash
   flutter pub get
   ```

4. Execute o app (web ou mobile):
   ```bash
   flutter run -d chrome
   # ou para Android/iOS
   flutter run
   ```

---

## 📈 Planejamento futuro

Este projeto está em constante evolução! Algumas funcionalidades planejadas incluem:

- Integração com banco de dados real
- Login com autenticação segura
- Integração com WhatsApp para confirmação de agendamentos
- Dashboard com estatísticas da clínica
- Geração de relatórios em PDF

---

## 👨‍💼 Autor

Desenvolvido por **Marlon David**  
[LinkedIn](https://www.linkedin.com/in/marlon-david-30a32122b/)  
[email](mailto:marllondaavid@gmail.com)
[whatsapp](21969766390)

---

## 📄 Licença

Este projeto está sob a licença [MIT](LICENSE).
