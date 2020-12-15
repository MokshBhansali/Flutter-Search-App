class UserViewModel {
  int id;
  String name;
  String email;
  UserViewModel({this.id, this.name, this.email});
  factory UserViewModel.fromJson(Map<String, dynamic> json) {
    return UserViewModel(
      id: json["id"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
      
      
    );
  }
}
