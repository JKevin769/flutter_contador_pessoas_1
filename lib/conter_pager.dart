import 'package:flutter/material.dart';
import 'package:flutter_contador_pessoas_1/main.dart';

void main(){
  runApp(const MyApp());
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});


   @override
  State<StatefulWidget> createState()=> _CounterPageState(); 
}
   // A classe que contém o estado e a lógica do app.
   class _CounterPageState extends State<CounterPage> {
// Variável de instância privada que armazenará a contagem.
int _counter = 0;
// Método em Dart que incrementa a contagem.
void _incrementCounter() {
// setState é um método do Flutter que informa que
// o estado mudou e que a interface deve ser redesenhada.
setState(() {
  _counter++;
  print('O contador atual é: $_counter');
  });
  }
   @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Contador')
      ),
      body: const Center(
        child: Text('Você pressionou o botão'),
        )
        );
        floatingActionButton: FloatingActionButton(
          onPressed:_incrementCounter,); // FloatingActionButton
  } 
}

class CounterPageV1 extends StatelessWidget{
 const CounterPageV1({super.key});


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Contador')
      ),
      body: const Center(
        child: Text('Você pressionou o botão'),
        )
        );
  } 
}

class CounterPageV2 extends StatelessWidget{
  //const CounterPageV2({super.key});
  int _counter = 0; // deve ser const se usar const no 
  //construtor
  @override
  Widget build(BuildContext context) {
    // O Scaffold é a estrutura da tela.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Pessoas'),
        ),body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Você pressionou o botão este número de vezes:',
              ), // Text
              Text(
                '$_counter', // Exibe o valor da variável _counter.
                style: Theme.of(context).textTheme.headlineMedium,
              ), // Text
            ], // <Widget>[]
          ), // Column
        ), // Center
       ); // Scaffold
      } // Widget
    }

    class CounterPageV3 extends StatelessWidget{
      int _counter = 0;
      @override
      Widget build(BuildContext context) {
        return Scaffold(// O Scaffold é a estrutura da tela.
        appBar: AppBar(
          title: const Text('Contador de Pessoas'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text
                ('Você pressionou o botão este número de vezes:',
                ), // Text
                Text('$_counter', // Exibe o valor da variável _counter.
                style: Theme.of(context).textTheme.headlineMedium,
                ), // Text
              ], // <Widget>[]
            ), // Column
          ), // Center
          floatingActionButton: FloatingActionButton(
            onPressed: null,
          //onPressed: _incrementCounter
          tooltip: 'Incrementar',
          child: const Icon(Icons.add),
          ), // FloatingActionButton
        ); // Scaffold
      } // Widget
    } // class

 