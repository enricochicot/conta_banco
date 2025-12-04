import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // Mantivemos o construtor 'titulo' para não quebrar seu código de Login
  const HomePage({super.key, required this.titulo}); 
  final String titulo;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. Lista de Tarefas (Memória da tela)
  final List<String> _tarefas = [];
  
  // 2. Controlador para ler o texto digitado
  final TextEditingController recebeAnotacao = TextEditingController();

  // Função que adiciona a tarefa na lista
  void _adicionarTarefa() {
    if (recebeAnotacao.text.isNotEmpty) {
      setState(() {
        _tarefas.add(recebeAnotacao.text); // Adiciona na lista
        recebeAnotacao.clear(); // Limpa o campo de digitação
      });
    }
  }

  // Função para remover tarefa ao clicar na lixeira
  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }

  void _removerTudo() {
    setState(() {
      _tarefas.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Usa o título que veio da tela de Login (ex: "Página Inicial")
        title: Text(widget.titulo), 
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // --- PARTE DE CIMA: CAMPO DE TEXTO E BOTÃO ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: recebeAnotacao,
                    decoration: const InputDecoration(
                      labelText: 'Nova Tarefa',
                      hintText: 'Ex: Estudar Flutter',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _adicionarTarefa,
                  backgroundColor: Colors.deepPurple,
                  child: const Icon(Icons.add, color: Colors.white),
                  mini: true, // Deixa o botão um pouco menor
                ),
              ],
            ),
          ),

          // --- PARTE DE BAIXO: LISTA DE ITENS ---
          Expanded(
            child: _tarefas.isEmpty
                ? const Center(child: Text("Nenhuma tarefa ainda...")) // Se estiver vazio
                : ListView.builder(
                    itemCount: _tarefas.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple[100],
                            child: Text("${index + 1}"),
                          ),
                          title: Text(
                            _tarefas[index],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removerTarefa(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}