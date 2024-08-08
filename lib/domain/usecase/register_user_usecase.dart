import 'package:flutter_task_xam/data/model/user_registration_response.dart';
import 'package:flutter_task_xam/domain/entity/user_registration_entity.dart';
import 'package:flutter_task_xam/domain/repository/user_registration_domain_repository.dart';

class RegisterUserUseCase {
  final IUserRepository userRepository;

  RegisterUserUseCase(this.userRepository);

  Future<UserRegistrationResponse?> call(UserRegistrationEntity request) {
    return userRepository.register(request);
  }
}


// ito ang dinagdag ko na usecase para ma handle ng maayos ang pagpapasa ng entity. Saka magagamit din natin to para meron tayong direct contact sa data repository. So lahat ng mga functions or data na need natin dumadaan sa usecase. Mapapadali ang pag debug dito kasi kada function, isang usecase.
