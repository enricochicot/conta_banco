class LoginController {
 bool validate (String username, String password) {
   // Lógica simples de validação
   if (username == 'root' && password == 'root') {
     return true;
   }
   return false;
 }
}


