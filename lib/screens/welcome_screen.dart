import 'package:flutter/material.dart';
import 'package:agendamento_app/screens/agendamento_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(
      "Tentando carregar a imagem de fundo...",
    ); // Teste para depuração

    return Scaffold(
      appBar: AppBar(title: const Text("Bem-vindo!")), // Barra no topo
      body: Stack(
        children: [
          // Verifica se a imagem está sendo carregada
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/fundo.jpg",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    "Erro ao carregar imagem",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),

          // Conteúdo da tela
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Icon(
                  Icons.calendar_today,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => const AgendamentoScreen(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Text("Clique aqui para agendar sua consulta"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
