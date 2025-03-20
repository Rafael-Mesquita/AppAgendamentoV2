import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/agendamento_screen.dart';

void main() {
  runApp(const AgendamentoApp());
}

class AgendamentoApp extends StatelessWidget {
  const AgendamentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/agendamento': (context) => const AgendamentoScreen(),
      },
    );
  }
}
