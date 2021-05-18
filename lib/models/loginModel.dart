class LoginModel {
  final String  email;
  final String  password; 
  bool  login = false; 
  LoginModel({ this.email, this.password, this.login=false}):assert(login!=null);
}