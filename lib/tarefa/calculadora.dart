import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

// O StatefulWidget permite que a tela tenha um estado mutável (valores que mudam)
class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

// A classe State armazena as variáveis e a lógica da nossa tela
class _CalculadoraState extends State<Calculadora> {
  // Controladores para capturar o que o usuário digita nos campos de texto
  final TextEditingController _controleNum1 = TextEditingController();
  final TextEditingController _controleNum2 = TextEditingController();
  
  // Variável de estado que guardará o texto final a ser exibido
  String _resultado = "Resultado: 0.0";

  // Função central para realizar os cálculos
  void _calcular(String operacao) {
    // tryParse converte a String digitada para double. Retorna null se for inválido.
    double? num1 = double.tryParse(_controleNum1.text);
    double? num2 = double.tryParse(_controleNum2.text);

    // Validação de entrada
    if (num1 == null || num2 == null) {
      setState(() {
        _resultado = "Por favor, insira números válidos.";
      });
      return;
    }

    // setState notifica o Flutter que o estado mudou e a tela precisa ser redesenhada
    setState(() {
      switch (operacao) {
        case '+':
          _resultado = "Resultado: ${num1 + num2}";
          break;
        case '-':
          _resultado = "Resultado: ${num1 - num2}";
          break;
        case '*':
          _resultado = "Resultado: ${num1 * num2}";
          break;
        case '/':
          if (num2 == 0) {
            _resultado = "Erro: Divisão por zero não é permitida.";
          } else {
            _resultado = "Resultado: ${num1 / num2}";
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Simples'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo para o primeiro número
            TextField(
              controller: _controleNum1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primeiro Número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            
            // Campo para o segundo número
            TextField(
              controller: _controleNum2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo Número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            
            // Botões de operação
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _construirBotaoOperacao('+'),
                _construirBotaoOperacao('-'),
                _construirBotaoOperacao('*'),
                _construirBotaoOperacao('/'),
              ],
            ),
            const SizedBox(height: 40),
            
            // Exibição do resultado (é atualizado via setState)
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para não repetir o código dos botões
  Widget _construirBotaoOperacao(String operacao) {
    return ElevatedButton(
      onPressed: () => _calcular(operacao),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(16),
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      child: Text(operacao),
    );
  }
}