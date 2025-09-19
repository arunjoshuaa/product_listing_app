
class UserModel {

  final String name;
  final String phoneNumber;
  

  UserModel({
 
    required this.name,
    required this.phoneNumber,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String
    );
      
  }
}
