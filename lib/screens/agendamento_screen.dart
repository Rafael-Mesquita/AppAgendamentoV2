import 'package:flutter/material.dart';

class AgendamentoScreen extends StatefulWidget {
  const AgendamentoScreen({super.key});

  @override
  _AgendamentoScreenState createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<AgendamentoScreen>
    with SingleTickerProviderStateMixin {
  // Controla as animações.
  late AnimationController _controller;

  //Variáveis que armazenam as diferentes animações aplicadas no widget.
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotateAnimation;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _dataConsultaController = TextEditingController();
  final TextEditingController _horarioConsultaController =
      TextEditingController();

  bool _showResumo = false;

  @override
  void initState() {
    super.initState();

    // Define a duração da animação.
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Faz o car crescer suavemente ao aparecer.
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Move o card de baixo para cima.
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(_controller);

    // Faz o card girar ao aparecer.
    _rotateAnimation = Tween<double>(begin: 0, end: 2).animate(_controller);
  }

  void _confirmarConsulta() {
    setState(() {
      _showResumo = true; // Atualiza o estado e refaz o build()
    });
    _controller.forward(); // Inicia as animações
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agendamento")),
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/fundo.jpg", // Caminho da imagem de fundo
              fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a tela
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: Icon(
                    Icons.calendar_today,
                    size: 80,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                TextField(
                  controller: _cidadeController,
                  decoration: InputDecoration(labelText: "Cidade"),
                ),
                TextField(
                  controller: _dataNascimentoController,
                  decoration: InputDecoration(labelText: "Data de Nascimento"),
                ),
                TextField(
                  controller: _dataConsultaController,
                  decoration: InputDecoration(labelText: "Data da Consulta"),
                ),
                TextField(
                  controller: _horarioConsultaController,
                  decoration: InputDecoration(labelText: "Horário da Consulta"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _confirmarConsulta,
                  child: Text("Confirmar Consulta"),
                ),
                const SizedBox(height: 20),
                _showResumo
                    ? SlideTransition(
                      position: _slideAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: RotationTransition(
                          turns: _rotateAnimation,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Agendamento realizado!",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Nome: ${_nomeController.text}"),
                                  Text("Cidade: ${_cidadeController.text}"),
                                  Text(
                                    "Data de Nascimento: ${_dataNascimentoController.text}",
                                  ),
                                  Text(
                                    "Data da Consulta: ${_dataConsultaController.text}",
                                  ),
                                  Text(
                                    "Horário: ${_horarioConsultaController.text}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
