class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  loginUserEntity? user;
  String? token;



}

class loginUserEntity {
  loginUserEntity({
      this.name, 
      this.email, 
  });

  String? name;
  String? email;



}