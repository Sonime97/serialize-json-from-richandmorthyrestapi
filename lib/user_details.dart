class UserDetails {
  String? idToken;
  String? email;
  UserDetails(this.idToken,this.email);

 UserDetails.fromJson(Map<String, dynamic> json)
      : idToken = json['idToken'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'idToken': idToken,
        'email': email,
      };
}