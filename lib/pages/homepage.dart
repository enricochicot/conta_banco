import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.titulo});
  final String titulo;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Banco"),
        backgroundColor: Colors.deepPurple, // Cor do Nubank/Inter
        foregroundColor: Colors.white, // Cor do texto
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Espaço nas bordas da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha tudo à esquerda
          children: [
            
            // 1. ÁREA DO SALDO (Um cartão simples)
            const Text("Seu Saldo:", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 10),
            
            const Text(
              "R\$ 1.250,00", 
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 30), // Espaço para separar

            // 2. BOTÕES DE AÇÃO (Pix, Pagar, etc)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espalha os botões
              children: [
                // Botão 1
                Column(
                  children: const [
                    Icon(Icons.pix, size: 40, color: Colors.deepPurple),
                    Text("Pix")
                  ],
                ),
                // Botão 2
                Column(
                  children: const [
                    Icon(Icons.qr_code, size: 40, color: Colors.deepPurple),
                    Text("Pagar")
                  ],
                ),
                // Botão 3
                Column(
                  children: const [
                    Icon(Icons.attach_money, size: 40, color: Colors.deepPurple),
                    Text("Transferir")
                  ],
                ),
                // Botão 4
                Column(
                  children: const [
                    Icon(Icons.receipt, size: 40, color: Colors.deepPurple),
                    Text("Boletos")
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40), // Espaço grande

            // 3. LISTA DE MOVIMENTAÇÕES (Extrato)
            const Text(
              "Histórico Recente", 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Item 1
            Card(
              child: ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.red), // Ícone na esquerda
                title: const Text("Supermercado"),
                subtitle: const Text("Compra no débito"),
                trailing: const Text("- R\$ 150,00", style: TextStyle(color: Colors.red)), // Valor na direita
              ),
            ),

            // Item 2
            Card(
              child: ListTile(
                leading: const Icon(Icons.work, color: Colors.green),
                title: const Text("Salário"),
                subtitle: const Text("Recebido de Empresa X"),
                trailing: const Text("+ R\$ 2.500,00", style: TextStyle(color: Colors.green)),
              ),
            ),

            // Item 3
            Card(
              child: ListTile(
                leading: const Icon(Icons.fastfood, color: Colors.red),
                title: const Text("Lanchonete"),
                subtitle: const Text("Pix enviado"),
                trailing: const Text("- R\$ 35,00", style: TextStyle(color: Colors.red)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}