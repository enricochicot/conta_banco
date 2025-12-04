import 'package:conta_banco/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:conta_banco/controllers/logincontroller.dart';

// A Tela Principal (Que tem movimento/estado)
class MinhaPaginaPrincipal extends StatefulWidget {
  const MinhaPaginaPrincipal({super.key, required this.titulo});

  final String titulo;

  @override
  State<MinhaPaginaPrincipal> createState() => _MinhaPaginaPrincipalState();
}

// 3. O Estado da Tela (Onde ficam seus dados)
class _MinhaPaginaPrincipalState extends State<MinhaPaginaPrincipal> {

final TextEditingController _usernameController = TextEditingController(); // Capturadores de texto
final TextEditingController _passwordController = TextEditingController();

 @override
Widget build(BuildContext context) {
  return Scaffold(
    // Cor de fundo levemente cinza para destacar o cartão branco
    backgroundColor: Colors.grey[200], 
    
    body: Center(
      child: SingleChildScrollView( // Permite rolar se a tela for pequena
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400), // TRAVA A LARGURA!
            
            child: Card(
              elevation: 8, // Sombra do cartão
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(32.0), // Espaço interno do cartão
                child: Column(
                  mainAxisSize: MainAxisSize.min, // O cartão ocupa só o necessário
                  children: [
                    
                    // 1. LOGO / ÍCONE
                    const Icon(Icons.account_circle, size: 100, color: Colors.deepPurple),
                    const SizedBox(height: 20),
                    
                    const Text(
                      'Bem-vindo!',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),

                    // 2. CAMPO USUÁRIO
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        prefixIcon: const Icon(Icons.person), // Ícone dentro
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 3. CAMPO SENHA
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 4. BOTÃO DE LOGIN GRANDE
                    SizedBox(
                      width: double.infinity, // O botão estica na largura do cartão
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          if (!LoginController().validate(
                            _usernameController.text,
                            _passwordController.text,
                          )) {
                            // Mostra um alerta de erro
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Erro de Login'),
                                content: const Text('Usuário ou senha incorretos.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }                        
                          else {
                            // Navega para a HomePage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(titulo: 'Página Inicial'),
                              ),
                            );
                          }
                        },
                        child: const Text('ENTRAR', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}}