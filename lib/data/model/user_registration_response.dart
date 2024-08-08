class UserRegistrationResponse {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String createdAt;

  UserRegistrationResponse({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.createdAt,
  });

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return UserRegistrationResponse(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobileNumber: json['mobileNumber'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'createdAt': createdAt,
    };
  }
}
