class User {
  final String? uid;
  //final String fullName;
  final String email;
  final String password;



  const User({
    required this.uid,

   // required this.fullName,
    required this.email,
    required this.password,
  });

  toJson(){
    return{
    //  "FullName": fullName,
      "Email": email,
      "Password": password,
    };
  }
}
