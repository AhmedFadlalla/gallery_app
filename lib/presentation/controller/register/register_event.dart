import 'package:equatable/equatable.dart';
abstract class BaseRegisterEvent extends Equatable{

  @override
  List<Object?> get props => [];

  BaseRegisterEvent();
}

class UserLoginEvent extends BaseRegisterEvent{

  final String email;
  final String password;


  UserLoginEvent({
    required this.email,
    required  this.password,
  });
}