import 'package:flutter_task_xam/data/model/user_registration_response.dart';
import 'package:flutter_task_xam/domain/entity/user_registration_entity.dart';

abstract class IUserRepository {
  Future<UserRegistrationResponse?> register(UserRegistrationEntity request);
}


// gumawa ako ng abstract class, if eh follow natin ang SOLID principle sa clean arch. Ito yung Interface Segregation Principle (ISP) and Single Responsibility Principle (SRP). Ito ang nag dedifine sa repository interface para sa registration process. 
