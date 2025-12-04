class LoginController {
 bool validate (String username, String password) {
   // Lógica simples de validação
   if (username == 'admin@example.com' && password == 'password123') {
     return true;
   }
   return false;
 }
}


