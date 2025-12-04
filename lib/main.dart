// Importa seu backend
import 'package:flutter/material.dart';
import 'pages/loginpage.dart';


// Função Principal (Início do App)
void main() {
  runApp(const MyApp());
}

// 1. Configuração do App (Cores, Fontes)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 36, 37, 94)), // Cor de fundo
        useMaterial3: true,
      ),
      home: const MinhaPaginaPrincipal(titulo: 'Login de Conta'),
    );
  }
}





