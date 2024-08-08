class UserRegistrationEntity {
  String? email;
  String? firstName;
  String? mobileNumber;
  String? lastName;

  UserRegistrationEntity({
    this.email,
    this.firstName,
    this.mobileNumber,
    this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
    };
  }
}

// ito yung request dati, hehe binago ko at ginawa ko entity para di ako malito haha. Tapos nag dagdag narin ako ng toJson para ma convert ang object into JSON-serializable map. Para ma print natin into json.
